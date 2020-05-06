/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks triple shift via type alias for int
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases,triple-shift
import '../../../Utils/expect.dart';

typedef IntAlias = int;

main() {
  IntAlias i = 1;

  Expect.equals(0, i >>> 1);
  Expect.equals(0, i >>> 2);
  Expect.equals(1, i >>> 64);
  Expect.equals(0, i >>> 100);

  int j = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(0, j >>> 1);
  Expect.equals(0, j >>> 2);
  Expect.equals(0, j >>> 3);

  int k = 129;
  Expect.equals(4, k >>> 261);

  int l = 1295555555;
  Expect.equals(l, l >>> 0);
}
