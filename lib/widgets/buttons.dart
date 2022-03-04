import 'package:andys_buzz/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';

void increment(balance) {
  balance.state++;
}

class ButtonUp extends ConsumerWidget {
  const ButtonUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () => increment(ref.watch(balanceProvider.state)),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

void decrement(balance) {
  balance.state = balance.state - 2;
}

class ButtonDown extends ConsumerWidget {
  const ButtonDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () =>
          decrement(ref.watch(balanceProvider.state)), // decrement2(),
      tooltip: 'Increment',
      child: const Icon(Icons.remove),
    );
  }
}

class ButtonBoltPower extends ConsumerWidget {
  final Bolt bolt;
  const ButtonBoltPower({Key? key, required this.bolt}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toggle() {
      //TODO see if can be used as callback
      ref.read(boltsProvider.notifier).toggle(bolt.id);
    }

    return FloatingActionButton.small(
      heroTag: null,
      onPressed: () => toggle(),
      tooltip: 'On/Off',
      child: const Icon(Icons.power_settings_new_rounded),
      backgroundColor: bolt.isLive
          ? Color.fromARGB(255, 121, 252, 55)
          : Color.fromARGB(255, 47, 79, 255),
      foregroundColor: bolt.isLive
          ? Color.fromARGB(255, 255, 153, 0)
          : Color.fromARGB(255, 107, 107, 107),
      elevation: bolt.isLive ? 10 : 0,
    );
  }
}
