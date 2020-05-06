/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sqrt(num x)
 * Converts [x] to a double and returns the positive square root of the value.
 *    Throws an error if [x] is null.
 * @description Checks that Error is thrown when passed argument is a null (not
 * a number).
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Math.sqrt(null);
  });
}
