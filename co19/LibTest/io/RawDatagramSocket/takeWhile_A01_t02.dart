/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 *
 * Returns a stream that provides the same events as this stream until test
 * fails for a data event. The returned stream is done when either this stream
 * is done, or when this stream first emits a data event that fails test.
 *
 * @description Checks that method [takeWhile] returns stream with the same
 * events as this stream as long as test returns true for the event data, and
 * the returned stream is done when either this stream is done, or when this
 * stream first provides a value that test doesn't accept.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(test(e), dataExpected) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((producer) {
    RawDatagramSocket.bind(address, 0).then((receiver) {
      int sent = 0;
      int counter = 0;
      List list = [];
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.send([sent++], address, receiver.port);
      producer.close();

      Stream bcs = receiver.asBroadcastStream();
      Stream s = bcs.takeWhile((e) => test(e));
      s.listen((event) {
        list.add(event);
      }, onDone: () {
        Expect.listEquals(dataExpected, list);
        asyncEnd();
      });

      bcs.listen((event) {
        receiver.receive();
        counter++;
      }).onDone(() {
        Expect.equals(4, counter);
      });

      new Timer(const Duration(milliseconds: 200), () {
        Expect.isNull(receiver.receive());
        receiver.close();
      });
    });
  });
}

main() {
  List expected = [
    RawSocketEvent.write,
    RawSocketEvent.read,
    RawSocketEvent.read,
    RawSocketEvent.closed
  ];
  check((e) => e == RawSocketEvent.write || e == RawSocketEvent.read,
      expected.sublist(0, 3));
  check((e) => e != RawSocketEvent.read, expected.sublist(0, 1));
  check((e) => e == RawSocketEvent.read, []);
  check((e) => e is RawSocketEvent, expected);
}
