/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if a factory returns
 * a non-null object whose type is not a subtype of its actual return type.
 * @description Checks that returning an object whose type is not subtype of M
 * from factory constructor M produces a compile error. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class C {}
typedef CAlias = C;

class A extends C {
  factory A() { return new CAlias(); }
}

main() {
  new A();
}
