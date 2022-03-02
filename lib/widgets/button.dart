import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';

int increment(balance) {
  return balance.state++;
}

class ButtonTest extends ConsumerWidget {
  const ButtonTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> balance = ref.watch(balanceProvider.notifier);
    return FloatingActionButton(
      onPressed: () => increment(balance),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

int decrement(balance) {
  return balance.state = balance.state - 2;
}

class ButtonDown extends ConsumerWidget {
  const ButtonDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> balance = ref.watch(balanceProvider.notifier);
    return FloatingActionButton(
      onPressed: () => decrement(balance),
      tooltip: 'Increment',
      child: const Icon(Icons.remove),
    );
  }
}
