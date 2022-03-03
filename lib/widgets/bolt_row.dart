import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';
import 'package:andys_buzz/classes/classes.dart';

import 'widgets.dart';

Bolt fieldsToDart(bolts) {
  return Bolt(name: bolts["name"], location: bolts["location"]);
}

class BoltRow extends ConsumerWidget {
  final int row;
  const BoltRow({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // row with three cells.
    // Cell 1 Title of Bolt || Cell 2 Bolt info || Cell 3 on/off
    StateController<dynamic> bolts = ref.watch(boltProvider.notifier);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(row.toString()),
                Text(fieldsToDart(bolts.state[0]).name),
                Container(
                  padding: EdgeInsets.all(2),
                  // height: MediaQuery.of(context).size.height / 12,
                  child: Image(
                    fit: BoxFit.contain,
                    image: ResizeImage(
                      const NetworkImage(
                          'https://images.prismic.io/ohme/ff49fa70-9ec4-4ce3-8495-9986cbc9ac8a_type+2+-+type+2+home+charging.png?auto=compress,format'),
                      height: MediaQuery.of(context).size.height ~/ 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(5),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("Location: ${fieldsToDart(bolts.state[0]).location}"),
                const Text("Other Data: "),
              ],
            ),
          ),
        ),
        ButtonBoltPower(row: row),
      ],
    );
  }
}
