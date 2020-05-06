/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call an expression whose type is potentially
 * nullable and not dynamic.
 *
 * @description Check that it is a compile-time error to call an expression
 * whose type is potentially nullable and not dynamic. Test nullable function
 * type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
void foo() {}

typedef void Foo();

main() {
  Function? f1 = foo;
  f1();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  Foo? f2 = foo;
  f2();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
