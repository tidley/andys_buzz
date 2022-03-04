import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Bolt {
  const Bolt(
      {required this.id,
      required this.name,
      required this.location,
      required this.isLive,
      required this.registered});

  final String id;
  final String name;
  final String location;
  final bool isLive;
  final DateTime registered;

  Bolt copyWith(
      {String? id,
      String? name,
      String? location,
      bool? isLive,
      DateTime? registered}) {
    return Bolt(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      isLive: isLive ?? this.isLive,
      registered: registered ?? this.registered,
    );
  }
}

class BoltNotifier extends StateNotifier<List<Bolt>> {
  BoltNotifier()
      : super([
          Bolt(
              id: "0",
              name: "First",
              location: "heaven",
              isLive: false,
              registered: DateTime.now()),
          Bolt(
              id: "1",
              name: "s",
              location: "floor",
              isLive: true,
              registered: DateTime.now()),         
        ]);

  void addBolt(Bolt bolt) {
    state = [...state, bolt];
  }

  void removeBolt(String boltId) {
    state = [
      for (final bolt in state)
        if (bolt.id != boltId) bolt,
    ];
  }

  void toggle(String boltId) {
    state = [
      for (final bolt in state)
        if (bolt.id == boltId) bolt.copyWith(isLive: !bolt.isLive) else bolt,
    ];
  }
}
