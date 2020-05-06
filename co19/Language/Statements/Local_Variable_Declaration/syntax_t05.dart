/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement declares a new local variable.
 *   localVariableDeclaration:
 *     initializedVariableDeclaration ’;’
 *   ;
 * @description Checks that the variable 'int id;' declared in a block is not
 * available in a scope that encloses this block.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */
main() {
  {
    int id;
  }
  id = null;
}
