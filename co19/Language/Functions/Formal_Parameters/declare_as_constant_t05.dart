/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a formal parameter is declared as
 * a constant variable.
 * @description Checks that it is a compile-time error if an optional positional
 * parameter is declared as a constant variable.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

void f([const x]) {}

main () {
  try {
    f(1);
  } catch (x) {}
}
