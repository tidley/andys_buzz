import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';

TableRow headerRow(balance) {
  return TableRow(
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        height: 32,
        child: Text(
          balance.toString(),
          textAlign: TextAlign.center,
        ),
      ),
      const TableCell(
        child: Text(
          "Total",
          textAlign: TextAlign.center,
        ),
      ),
      TableCell(
        child: Text(
          "Site ${balance.toString()}",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

class OverviewTable extends ConsumerWidget {
  const OverviewTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int balance = ref.watch(balanceProvider);
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        // 1: FlexColumnWidth(),
        // 2: FlexColumnWidth(), //FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        headerRow(balance),
        TableRow(
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Text(balance.toString()),

              // child: Consumer(
              //   builder: (context, _ref, _) {
              //     final int _balance = _ref.watch(balanceProvider.state).state;
              //     return Text(_balance.toString());
              //   },
              // ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
              child: Text("asdsafas"),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        )
      ],
    );
  }
}
