/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a type alias, either directly or recursively
 * via another type declaration, is a compile-time error
 * @description Checks that any self reference in a type alias is a compile-time
 * error.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class A implements CAlias {}
class C extends A {}
typedef CAlias = C;

main() {
}
