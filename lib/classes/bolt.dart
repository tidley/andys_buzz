import 'dart:isolate';

import 'package:andys_buzz/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bolt {
  String name;
  String location;
  bool isPowered;
  DateTime registered = DateTime.now();

  Bolt({required this.name, required this.location, this.isPowered = false});
}

@immutable
class BoltTest {
  const BoltTest({required this.id, required this.isLive});

  final String id;
  final bool isLive;

  BoltTest copyWith({String? id, bool? isLive}) {
    return BoltTest(id: id ?? this.id, isLive: isLive ?? this.isLive);
  }
}

class BoltTestNotifier extends StateNotifier<List<BoltTest>> {
  BoltTestNotifier()
      : super([
          const BoltTest(id: "0", isLive: false),
          const BoltTest(id: "1", isLive: true),
          const BoltTest(id: "2", isLive: true),
          const BoltTest(id: "3", isLive: true)
        ]);

  void toggle(String boltId) {
    state = [
      for (final bolt in state)
        if (bolt.id == boltId) bolt.copyWith(isLive: !bolt.isLive) else bolt,
    ];
  }
}
