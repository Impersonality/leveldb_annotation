#include <iostream>
#include "leveldb/db.h"

using namespace std;

int main() {
  leveldb::DB* db;
  leveldb::Options options;
  leveldb::Status status = leveldb::DB::Open(options, "/tmp/testdb", &db);

  db->Put(leveldb::WriteOptions(), "aaa", "000");
//  std::string value;
//  db->Get(leveldb::ReadOptions(), "aaa", &value);
//  std::cout << value << std::endl;

  auto it = db->NewIterator(leveldb::ReadOptions());
  for (it->SeekToFirst(); it->Valid(); it->Next()) {
    cout << it->value().ToString() << endl;
  }

  delete it;
  delete db;
}