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