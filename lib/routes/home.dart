import 'package:andys_buzz/classes/classes.dart';
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
    final List<BoltTest> buttonColProv = ref.watch(powerButtonGreen);
    List<BoltTest> boltsProvider = ref.watch(powerButtonGreenNotifier);

    List<BoltRow> _boltRows() {
      List<BoltRow> _rows = [];
      for (final bolt in buttonColProv) {
        _rows.add(BoltRow(
          bolt: bolt,
        ));
      }
      return _rows;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome Home ${ref.watch(currentUserProvider.notifier).state}'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _boltRows(),
                    //  [
                    // const BoltRow(row: 0),
                    // const BoltRow(row: 1),
                    // Column(
                    //   children:
                    //       exampleList.map((e) => BoltRow(row: e)).toList(),
                    // ),
                    // ],
                  ),
                ],
              ),
            ),
            const OverviewTable(),
            Text(value +
                balance.toString() +
                boltsProvider[0].isLive.toString()),
            const ButtonDown(),
          ],
        ),
      ),
      floatingActionButton: const ButtonTest(),
    );
  }
}
