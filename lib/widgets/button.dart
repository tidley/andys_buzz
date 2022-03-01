import 'dart:html';

import 'package:flutter/foundation.dart';
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
      // onPressed: () => increment(balance.state),
      onPressed: () => increment(balance),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
