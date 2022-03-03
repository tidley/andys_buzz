import 'package:andys_buzz/widgets/bolt_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';
import 'package:andys_buzz/widgets/widgets.dart';

List<int> exampleList = [0, 1, 2, 3];

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int balance = ref.watch(balanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome Home ${ref.watch(currentUserProvider.notifier).state}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BoltRow(row: 1),
                        // const BoltRow(row: 2),
                        // Column(
                        //   children:
                        //       exampleList.map((e) => BoltRow(row: e)).toList(),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: const OverviewTable(),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10,
                alignment: Alignment.center,
                child: Text(value + balance.toString()),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 8,
                child: const ButtonDown(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const ButtonUp(),
    );
  }
}
