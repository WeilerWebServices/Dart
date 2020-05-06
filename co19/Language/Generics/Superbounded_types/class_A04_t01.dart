/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a parameterized type [T] is
 * super-bounded when it is used in any of the following ways:
 * ...
 * [T] is an immediate subterm of an [extends] clause of a class (10.8), or it
 * occurs as an element in the type list of an [implements] clause (10.9), or a
 * [with] clause (10).
 * @description Checks that exception is thrown if super-bounded class occurs in
 * an immediate subterm of the [extends] clause.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

class B1 extends A {}             //# 01: compile-time error
class B2<X extends A<X>> extends A<X> {}

class B3 extends A<dynamic> {}    //# 02: compile-time error
class B4 extends A<Object> {}     //# 03: compile-time error
class B5 extends A<void> {}       //# 04: compile-time error
class B6 extends A<Null> {}

class B7 extends A<A<dynamic>> {} //# 05: compile-time error
class B8 extends A<A<Object>> {}  //# 06: compile-time error
class B9 extends A<A<void>> {}    //# 07: compile-time error
class B10 extends A<A<Null>> {}

main() {}
