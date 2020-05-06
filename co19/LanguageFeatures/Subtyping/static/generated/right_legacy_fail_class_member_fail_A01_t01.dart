/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Legacy T1 is S1* then:
 * - T0 <: T1 iff T0 <: S1?
 * @description Check that if type T1 is S1* and T0 is not subtype of S1? then
 * T0 is not subtype of T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 not a subtype of a type T1, then it cannot
 * be used as a class member of type T1. Assignment to static and instance class
 * variables is tested.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @author ngl@unipro.ru
 */
/*
 * This test is generated from right_legacy_fail_A01.dart and 
 * class_member_fail_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

class C extends X {}

C? t0Instance = new C();
Y t1Instance = new Y();

const t1Default = const Y();




class ClassMemberTestStatic {
  static Y s = t1Default;

  ClassMemberTestStatic(C? val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    s = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static set staticSetter(C? val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static Y get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  Y m = t1Default;

  ClassMemberTestPublic(C? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(C? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(C? val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  Y get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  Y _m = t1Default;

  ClassMemberTestPrivate(C? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(C? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(C? val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static Y s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Y m = t0Instance;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
