/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * int getInt64(
 *     int byteOffset, [
 *     Endian endian = Endian.big
 * ])
 * ...
 * Throws [RangeError] if [byteOffset] is negative, or `byteOffset + 8` is
 * greater than the length of this object.
 * @description Checks that [RangeError] is thrown if `byteOffset + 8` is
 * greater than the length of this object.
 * @issue 12880
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(10);
  try {
    byteData.getInt64(3);
    Expect.fail("RangeError is expected");
  } on RangeError {}

  try {
    byteData.getInt64(20);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}
