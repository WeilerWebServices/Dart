/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	     Corresponding member name
 *   X binop expr2        +, -, *, / , ~/, %, <, <=, >, >=, <<, >>, >>>, ^, |, &
 * @description Check explicit extension member invocation in form of X << expr2
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String value;
  C(this.value);
  String operator <<(C other) => this.value + "," + other.value;
}

extension Extension1 on C {
  String operator <<(C other) => "Show must go on," + other.value;
}

extension Extension2 on C {
  String operator <<(C other) => "Let it be," + other.value;
}

main() {
  C c = new C("Lily was here");
  C other = new C("No woman no cry");
  Expect.equals("Show must go on,No woman no cry", Extension1(c) << other);
  Expect.equals("Let it be,No woman no cry", Extension2(c) << other);
  Expect.equals("Lily was here,No woman no cry", c << other);
}
