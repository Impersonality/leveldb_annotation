###Q
- [x] 1.解析13中举例，一块0-7kb的data_block的key存于一块filter_block中，但是filter_block严格按照0-2kb为一块创建。
结果变成了一块filter_block存了data_block的key，之后创建了两块空filter_block。为什么不设计成类似data_block，
存满再创建一块新的，或者严格一块data_block对应filter_block的关系?（data_block和filter_block大小应该对不上，因为filter_block只存了key）

- [x] 2.通过filter_block查找时，如果filter_block为空时，content为nil，应该查不出东西

- [x] 3.leveldb如何保持插入时的有序呢，memtable是skip_list，插入有序，sstable如何保持顺序呢

- [ ] 4.如果mem未满，还未写入sstable时，leveldb重启了，重启后如何恢复的mem

- [ ] 5.解析16中提到，level=0的sstable会有重合，level>0的不会，为什么

- [ ] 6.merger.cc中，如果mem,level0,level1都有key=a，next后 key会一直是a么？

- [ ] 7.SequenceNumber的作用是什么？

- [ ] 8.每次add/update数据时sequence会增加，那么get时key+seq+type应该查不到之前的数据，实际为啥能查到呢？


###A
1.被解析13的图误会了，filter_block的大小和data_block大小没有关系，data_block通过自身大小找到filter_offsets_对应的filter_block的位置

2.不会出现这种情况，解析13中例子，data_block起始为0-7kb，查询时会用0作为block_offset条件查询，必然查到filter_block1。
  设置空filter_block就是为了方便查询，这样data_block2 使用7+1作为block_offset查询时，会查到filter_block4
  
3.memtable是skip_list，插入有序，sstable是由mem->imm->sstable，所以也是有序