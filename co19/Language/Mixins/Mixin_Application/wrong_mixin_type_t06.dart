/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin application of the form S with M1,...,Mk; defines a class
 * C whose superclass is the application of the mixin composition
 * Mk−1 ∗ ... ∗ M1 to S
 * ...
 * It is a compile-time error if M (respectively, any of M1,..., Mk) is
 * an enumerated type or a malformed type.
 * @description Checks that it is a compile-time error if Mi is malformed type
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class S {
}

class M1 {
}

var M2;

class M3 {
}

class C = S with M1, M2, M3;

main() {
  new C();
}
