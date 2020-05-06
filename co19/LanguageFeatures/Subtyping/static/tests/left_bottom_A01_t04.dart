/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Bottom: if T0 is Never then T0 <: T1
 * @description Check that if type T0 is Never then T0 is a subtype of T1
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../../../Utils/expect.dart";
class T1 {}

class C<X extends T1> {}
void foo<X extends T1>() {}

typedef Neverland = Never;

main() {
  Expect.isTrue(C<Neverland>() is C<Never>);
  void x2 = foo<Neverland>();
}
