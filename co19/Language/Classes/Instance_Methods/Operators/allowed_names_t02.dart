/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The following names are allowed for user-defined operators:
 * <, >, <=, >=, ==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>, >>>, []=, [], ˜.
 * @description Checks that operator != cannot be defined in a user class.
 * @compile-error
 * @author vasya
 */

class C {
  operator !=(other) {}
}

main() {
  try {
    var b = (new C() != new C());
  } catch (x) {}
}

