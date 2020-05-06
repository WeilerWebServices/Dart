/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If m is marked async*, then:
 *    • It is a dynamic error if the class of o does not implement Stream.
 *  Otherwise
 *    • For each element x of o:
 *    – If the stream u associated with m has been paused, then execution
 * of m is suspended until u is resumed or canceled.
 *    – If the stream u associated with m has been canceled, then let c be
 * the finally clause of the innermost enclosing try-finally statement, if any.
 * If c is defined, let h be the handler induced by c. If h is defined,
 * control is transferred to h. If h is undefined, the immediately enclosing
 * function terminates.
 *    – Otherwise, x is added to the stream associated with m in the order
 * it appears in o. The function m may suspend.
 *    • If the stream o is done, execution of s is complete.
 *
 * @description Check that if the stream u associated with m has been
 * canceled and there is no enclosing try finally statement, the immediately
 * enclosing function terminates.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Stream<int> input) async* {
  yield* input;
}

Future test() async {
  List log = [];
  var data = new Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);
  Stream<int> s = generator(data);
  StreamSubscription<int> ss;
  ss = s.listen(
      (int i) async {
        log.add(i);
        if (i == 5) {
          ss.cancel();

          Expect.listEquals([1,2,3,4,5], log);
          await new Future.delayed(new Duration(milliseconds: 100));
          Expect.listEquals([1,2,3,4,5], log);
          await new Future.delayed(new Duration(milliseconds: 100));
          Expect.listEquals([1,2,3,4,5], log);
          asyncEnd();
        }
      }
  );
}

main() {
  asyncStart();
  test();
}