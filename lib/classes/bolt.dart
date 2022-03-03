import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bolt with ChangeNotifier {
  String name;
  String location;
  bool isPowered;
  DateTime registered = DateTime.now();

  Bolt({required this.name, required this.location, this.isPowered = false});
}

// class BoltsNotifier extends StateNotifier<List<Bolt>> {
//   BoltsNotifier()
//       : super([
//           Bolt(name: "a", location: "1"),
//           Bolt(name: "b", location: "2", isPowered: true),
//           Bolt(name: "c", location: "3"),
//           Bolt(name: "d", location: "4")
//         ]);
//   void toggle(int boltId) {
//     state = [
//       for (final bolt in state)
//         // we're marking only the matching todo as completed
//         if (bolt.location == boltId.toString())
//           // Once more, since our state is immutable, we need to make a copy
//           // of the todo. We're using our `copyWith` method implemented before
//           // to help with that.
//           bolt.isPowered = !bolt.isPowered,
//         else
//           // other todos are not modified
//           todo,
//     ];
//   }
// }
