/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * Removes all objects from this list that fail to satisfy test.
 * ...
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that [UnsupportedError] is thrown since [Int64List] is a
 * fixed-length list.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int64List.fromList(list);
  var length = l.length;
  try {
    l.retainWhere((e) => true );
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);

  try {
    l.retainWhere((e) => false );
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}
