import 'package:andys_buzz/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';

void increment(balance) {
  balance.state++;
}

class ButtonTest extends ConsumerWidget {
  const ButtonTest({Key? key}) : super(key: key);

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

void invertBool(_boolIn) {
  print("_boolIn: ${_boolIn.state[0]}");
  dynamic _tTemp = _boolIn;
  _tTemp.state[0] = !_boolIn.state[0];
  _boolIn.state = _tTemp.state;
}

class ButtonBoltPower extends ConsumerWidget {
  ButtonBoltPower({Key? key, required this.bolt}) : super(key: key);
  late BoltTest bolt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("bolt.isLive: ${bolt.isLive}");
    return FloatingActionButton.small(
      heroTag: null,
      onPressed: () => bolt.isLive = !bolt.isLive,
      //bolt = BoltTest(id: bolt.id, isLive: !bolt.isLive),
      // invertBool(ref.watch(powerButtonGreen.state)), // decrement2(),
      tooltip: 'Increment',
      child: const Icon(Icons.power_settings_new_rounded),
      backgroundColor: bolt.isLive ? Colors.green : Colors.pink,
    );
  }
}
