/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a type alias, either directly or recursively
 * via another type declaration, is a compile-time error
 * @description Checks that any self reference in a type alias is a compile-time
 * error. Test direct reference
 * @author sgrekhov@unipro.ru
 */
class C<T> {}

typedef CAlias1<T> = C<CAlias1>;                //# 01: compile-time error
typedef CAlias2<T extends CAlias2> = C<T>;      //# 02: compile-time error
typedef CAlias3 = CAlias3;                      //# 03: compile-time error

main() {
}
