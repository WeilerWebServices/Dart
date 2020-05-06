/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Function Type/Function: T0 is a function type and T1 is Function
 * @description Check that if type T0 is a function type and T1 is Function then
 * T0 is a subtype of T1. Test non-void generic function with positional
 * arguments
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from function_type_function_A16.dart and 
 * local_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
class C {}

typedef C T0<X>(C c, [X? d]);
C t0Func<X>(C c, [X? d]) => c;

T0<C> t0Instance = t0Func;
Function t1Instance = () {};

void foo() {}
const t1Default = foo;




class LocalVariableTest {

  LocalVariableTest() {
    Function t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    Function t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    Function t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    Function t1 = t0Instance;
    t1 = t0Instance;
  }

  Function t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
