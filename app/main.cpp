#include <iostream>
#include "leveldb/db.h"

using namespace std;

int main() {
  leveldb::DB* db;
  leveldb::Options options;
  options.create_if_missing = true;
  leveldb::Status status = leveldb::DB::Open(options, "/tmp/testdb", &db);
  if (!status.ok()) {
    cout << status.ToString() << endl;
    return 0;
  }

//  db->Put(leveldb::WriteOptions(), "aaa", "000");
  string val;
  db->Get(leveldb::ReadOptions(), "aaa", &val);
  cout << val << endl;
//  db->Delete(leveldb::WriteOptions(), "aaa");

//  auto it = db->NewIterator(leveldb::ReadOptions());
//  for (it->SeekToFirst(); it->Valid(); it->Next()) {
//    cout << it->key().ToString() << " " << it->value().ToString() << endl;
//  }
//  delete it;

  delete db;
}