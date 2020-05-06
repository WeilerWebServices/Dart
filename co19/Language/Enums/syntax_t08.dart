/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An enumerated type, or enum, is used to represent a fixed number
 * of constant values.
 *  enumType:
 *  metadata enum id ‘{’ id [‘, ’ id]* [‘, ’] ‘}’
 *  ;
 * @description Checks that it no compile error if declared constant values
 * are separated with two commas.
 * @static-clean
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

enum E {a,, b}

main() {
  E e = E.b;
  Expect.equals(e, E.b);
}
