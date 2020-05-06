/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float64x2List.view(
 *     ByteBuffer buffer, [
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * If the offsetInBytes index of the region is not specified, it defaults to
 * zero (the first byte in the byte buffer).
 * @description Checks that if offsetInBytes index of the region is not
 * specified, it defaults to zero.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list) {
  Float64x2List tmp = new Float64x2List.fromList(list);
  var byteBuffer = tmp.buffer;
  Float64x2List l = new Float64x2List.view(byteBuffer);
  Expect.equals(list.length, l.length);
  Expect.equals(tmp[0].x, l[0].x);
  Expect.equals(tmp[0].y, l[0].y);
  Expect.equals(tmp[tmp.length - 1].x, l[l.length - 1].x);
  Expect.equals(tmp[tmp.length - 1].y, l[l.length - 1].y);
}

main() {
  check([
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ]);
  check([f64x2V(0.0), f64x2V(1.0), f64x2V(2.0)]);
  check([f64x2V(10.0), f64x2V(11.0)]);
}
