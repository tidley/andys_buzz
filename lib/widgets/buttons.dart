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
  final int row;
  const ButtonBoltPower({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<bool> buttonColProv = ref.watch(powerButtonGreen);
    List<BoltTest> boltsProvider = ref.watch(powerButtonGreenNotifier);
    print("boltsProvider[0].isLive: ${boltsProvider[row].isLive}");

    print("buttonColProv[0]: ${buttonColProv[0]}");
    List<bool> _off = ref.watch(powerButtonGreen.state).state;
    bool _boltIs = _off[0];
    print("_off $_off");
    return FloatingActionButton.small(
      heroTag: null,
      onPressed: () => ref
          .read(powerButtonGreenNotifier.notifier)
          .toggle(boltsProvider[row].id),
      // invertBool(ref.watch(powerButtonGreen.state)), // decrement2(),
      tooltip: 'Increment',
      child: const Icon(Icons.power_settings_new_rounded),
      backgroundColor: boltsProvider[row].isLive ? Colors.green : Colors.pink,
    );
  }
}
