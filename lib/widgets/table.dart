import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';

// TODO nicer layout https://www.geeksforgeeks.org/difference-between-rows-and-columns-vs-container-in-flutter/

class OverviewTable extends ConsumerWidget {
  const OverviewTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<int> balance = ref.watch(balanceProvider.notifier);
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 32,
              child: const Text(
                "-",
                textAlign: TextAlign.center,
              ),
            ),
            // const TableCell(
            //   child: Text(
            //     "-",
            //     textAlign: TextAlign.center,
            //   ),

            //   // child: SizedBox(
            //   //   height: 32,
            //   //   child: Text("-"),
            //   // ),
            // ),
            const TableCell(
              // verticalAlignment: TableCellVerticalAlignment.middle,

              child: Text(
                "Total",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // height: 32,
              color: Colors.green,
              child: Text(balance.state.toString()),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
              // height: 32,
              color: Colors.green,
              child: Text(balance.state.toString()),
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
