import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';
import 'package:andys_buzz/widgets/widgets.dart';

void increment_home() {}

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int balance = ref.watch(balanceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Home')),
      body: Center(
        child: Text(value + balance.toString()),
      ),
      floatingActionButton: const ButtonTest(),
    );
  }
}
