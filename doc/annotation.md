####write
db->Put(leveldb::WriteOptions(), "aaa", "000"); // app/main.cpp line11

```c++
Status DB::Put(const WriteOptions& opt, const Slice& key, const Slice& value) { // db_impl.cc line1532
    WriteBatch batch; //leveldb中不管单个插入还是多个插入都是以WriteBatch的方式进行的
    batch.Put(key, value);
    return Write(opt, &batch);
}
```

```c++
Status DBImpl::Write(const WriteOptions& options, WriteBatch* updates) { // db_impl.cc line1238
    ///
    Status status = MakeRoomForWrite(updates == nullptr);
    // 如果memtable满了，copy到imm中，再创建一个sstable，传递imm的iter参数，这样就写入了sstable中
    if (status.ok()) {
            status = WriteBatchInternal::InsertInto(updates, mem_); //插入memtable
    }
    ///
}
```

```c++
// WriteBatchInternal是工具类，把writebatch写入memtable
Status WriteBatchInternal::InsertInto(const WriteBatch* b, MemTable* memtable) { //write_batch.cc line134
    MemTableInserter inserter;
    inserter.sequence_ = WriteBatchInternal::Sequence(b);
    inserter.mem_ = memtable;
    return b->Iterate(&inserter);
}
```

```c++
// 和WriteBatchInternal类似，我不懂为啥还要再封装一层
Status WriteBatch::Iterate(Handler* handler) const { //write_batch.cc line44
    if (GetLengthPrefixedSlice(&input, &key) &&
        GetLengthPrefixedSlice(&input, &value)) {
        handler->Put(key, value);
    } 
}
```

```c++
void Put(const Slice& key, const Slice& value) override { //write_batch.cc line123
    mem_->Add(sequence_, kTypeValue, key, value);
    sequence_++;
}
```

```c++
void MemTable::Add(SequenceNumber s, ValueType type, const Slice& key,
                   const Slice& value) { // memtable.cc line76
    /// table_是skip_list，已经到最底层实现了
    table_.Insert(buf);
    ///
}
```


####iterator
auto it = db->NewIterator(leveldb::ReadOptions()); // app/main.cpp L16

```c++
Iterator* DBImpl::NewIterator(const ReadOptions& options) { // db_impl.cc L1191
    SequenceNumber latest_snapshot;
    uint32_t seed;
    // iter是数据的iter
    Iterator* iter = NewInternalIterator(options, &latest_snapshot, &seed);
    // NewDBIterator返回了DBIter，DBIter是Iterator的封装
    // DBIter在iter迭代时保存上一个key，如果next后的key和上一个key值相同并且不是delete，继续next。因为DBIter封装了MergeIter，
    // key可能在mem,imm,sstable都存在
    return NewDBIterator(this, user_comparator(), iter,
    (options.snapshot != nullptr ? static_cast<const SnapshotImpl*>(options.snapshot)->sequence_number(): latest_snapshot), seed);
}
```

```c++
Iterator* DBImpl::NewInternalIterator(const ReadOptions& options, SequenceNumber* latest_snapshot, uint32_t* seed) { //db_impl.cc L1090
    std::vector<Iterator*> list;
    list.push_back(mem_->NewIterator());    //mem.iter
    mem_->Ref();
    if (imm_ != nullptr) {
        list.push_back(imm_->NewIterator());    //imm.iter
        imm_->Ref();
    }
    versions_->current()->AddIterators(options, &list); //sstable.iter
    Iterator* internal_iter =
    NewMergingIterator(&internal_comparator_, &list[0], list.size());
    versions_->current()->Ref();
}
```

```c++
void Version::AddIterators(const ReadOptions& options,
                           std::vector<Iterator*>* iters) { // version_set.cc L230
    // level=0的sstable
    for (size_t i = 0; i < files_[0].size(); i++) {
        iters->push_back(vset_->table_cache_->NewIterator(
            options, files_[0][i]->number, files_[0][i]->file_size));
    }
    // level>0的table iter, 
    for (int level = 1; level < config::kNumLevels; level++) {
        if (!files_[level].empty()) {
            iters->push_back(NewConcatenatingIterator(options, level));
        }
    }
}
```

```c++
Iterator* NewMergingIterator(const Comparator* comparator, Iterator** children, int n) { // merger.cc L179
    return new MergingIterator(comparator, children, n);
}
```

####get
db->Get(leveldb::ReadOptions(), "hello", &val);

```c++
Status DBImpl::Get(const ReadOptions& options, const Slice& key, std::string* value) { //db_impl.cc L1128
    // mem -> imm -> sstable 读取
    LookupKey lkey(key, snapshot);
    if (mem->Get(lkey, value, &s)) {
    // Done
    } else if (imm != nullptr && imm->Get(lkey, value, &s)) {
    // Done
    } else {
        s = current->Get(options, lkey, value, &stats);
        have_stat_update = true;
    }
    // 根据统计结果决定是否调度后台 Compaction
    if (have_stat_update && current->UpdateStats(stats)) {
        MaybeScheduleCompaction();
    }
}
```

```c++
Status Version::Get(const ReadOptions& options, const LookupKey& k,
                    std::string* value, GetStats* stats) {  // version_set.cc L326
    // 从level0所有key<max_key && key>min_key的file,和level>0的earliest index whose largest key >= ikey找到file_id
    // 使用table_cache.Get获取key->val
    // 如果level0层查找过2次及以上table，返回stats，促进compaction
}
```


####compaction
