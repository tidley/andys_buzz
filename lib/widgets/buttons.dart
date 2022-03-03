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
      onPressed: () => increment(ref.read(balanceProvider.state)),
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
      onPressed: () => decrement(
        ref.read(balanceProvider.state),
      ),
      tooltip: 'Increment',
      child: const Icon(Icons.remove),
    );
  }
}

void boolFlip(bolts, row) {
  print(bolts.state[row].isPowered);
  bolts.state[row].isPowered = !bolts.state[row].isPowered;
  print(bolts.state[row].isPowered);
}

class ButtonPower extends ConsumerWidget {
  final int row;
  const ButtonPower({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<List<Bolt>> bolts = ref.watch(boltProvider.notifier);

    // final List<Bolt> bolts = ref.watch(boltProvider);
    print("bolts[row].isPowered");
    print(bolts.state[row].isPowered);
    // return Consumer(builder: (context, ref, _) {
    return FloatingActionButton.small(
        heroTag: null,
        onPressed: () => boolFlip(
              bolts,
              // ref.watch(boltProvider.state),
              row,
            ),

        //=              !bolt.isPowered, // decrement(ref.watch(balanceProvider.state)),
        tooltip: 'Switch power',
        child: const Icon(Icons.power_settings_new_rounded),
        // backgroundColor: ref.watch(boltProvider.state).state[row].isPowered

        backgroundColor:
            bolts.state[row].isPowered ? Colors.green : Colors.red);
    // });
  }
}
