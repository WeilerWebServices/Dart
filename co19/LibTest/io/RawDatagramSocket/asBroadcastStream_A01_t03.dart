/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> asBroadcastStream({
 *     void onListen(StreamSubscription<T> subscription),
 *     void onCancel(StreamSubscription<T> subscription)
 * })
 * Returns a multi-subscription stream that produces the same events as this.
 *
 * The returned stream will subscribe to this stream when its first subscriber
 * is added, and will stay subscribed until this stream ends, or a callback
 * cancels the subscription.
 *
 * @description Checks that a returned stream will subscribe to this stream when
 * its first subscriber is added, and will stay subscribed until a callback
 * cancels the subscription.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> check() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [5]];
  List<RawSocketEvent> received = [];
  List<RawSocketEvent> received1 = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  var mss = receiver.asBroadcastStream();

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  StreamSubscription ss;
  ss = mss.listen((event) {
    received1.add(event);
    if (received1.length == 3) {
      ss.cancel();
    }
  });

  mss.listen((event) {
    received.add(event);
    receiver.receive();
  }, onDone: () {
    Expect.listEquals(received.sublist(0, received1.length), received1);
    if (!completer.isCompleted) {
      completer.complete(received);
    }
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
    }
  });

  return f;
}

main() async {
  List<RawSocketEvent> expectedValues =
      [RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed];

  checkReceived(check, expectedValues, 7);
}
