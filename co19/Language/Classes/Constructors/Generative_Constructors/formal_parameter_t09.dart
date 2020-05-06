/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A formal constructor parameter is either a formal parameter or
 * an initializing formal. An initializing formal has the form this.id, where
 * id is the name of an instance variable of the immediately enclosing class.
 * It is a compile-time error if id is not the name of an instance variable of
 * the immediately enclosing class.
 * @description Checks that it is a compile-time error if id is the name of an
 * instance variable of the superclass. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class S {
  var x;
}
typedef SAlias = S;

class C extends SAlias {
  C(this.x) {}
}

main() {
  new C(null);
}