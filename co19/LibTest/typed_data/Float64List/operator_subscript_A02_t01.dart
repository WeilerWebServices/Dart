/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator [](int index)
 * ...or throws an [RangeError] if index is out of bounds.
 * @description Checks that an exception is thrown as expected.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float64List.fromList(list);
  try {
    l[-1];
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[l.length];
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x80000000];
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x7fffffff];
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check([]);
  check([1.0]);
  var list = new List<double>(255);
  for (int i = 0; i < 255; ++i) {
    list[i] = i * 1.0;
  }
  check(list);
}