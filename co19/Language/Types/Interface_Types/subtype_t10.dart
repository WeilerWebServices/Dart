/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Checks that an interface type may be assigned to its supertype.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";


class I {}

class A implements I {}

class B extends A {}

class C {}

class Checker<S> {
  Checker() {}

  check(dynamic t) {
    Expect.isTrue(t is S);
    S ss = t;
  }
}

main() {
  new Checker<num>().check(1);
  new Checker<num>().check(1.0);
  new Checker<A>().check(new B());
  new Checker<Object>().check(new C());
  new Checker<I>().check(new A());
}