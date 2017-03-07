/**
 * Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

namespace cpp2 fbzmq.test

cpp_include "folly/io/IOBuf.h"

// we'll use raw IOBuf to pass our serialized thrift data
typedef binary (cpp2.type = "std::unique_ptr<folly::IOBuf>") IOBufPtr

// we'll be writing this structure into KV store
struct TestValue {
  1: string value;
}

// a value as reported in get replies/publications
struct WrapperValue {
  1: i64 version;
  // the use of move-only object makes Value non-copyable
  2: IOBufPtr value;
}
