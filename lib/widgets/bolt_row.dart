import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';
import 'package:andys_buzz/classes/classes.dart';

import 'widgets.dart';

class BoltRow extends ConsumerWidget {
  final int row;
  const BoltRow({Key? key, required this.row}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Bolt _bolt = ref.watch(boltProvider.state).state[row];
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width / 2.5) - 20,
          child: Card(
            margin: const EdgeInsets.all(5),
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(row.toString()),
                  Text(_bolt.name),
                  Container(
                    padding: EdgeInsets.all(2),
                    // height: MediaQuery.of(context).size.height / 12,
                    child: Image(
                      fit: BoxFit.contain,
                      image: ResizeImage(
                        const NetworkImage(
                            'https://images.prismic.io/ohme/ff49fa70-9ec4-4ce3-8495-9986cbc9ac8a_type+2+-+type+2+home+charging.png?auto=compress,format'),
                        height: MediaQuery.of(context).size.height ~/ 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width / 1.75) - 20,
          child: Row(
            children: [
              Card(
                margin: const EdgeInsets.all(5),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text("Location: ${_bolt.location} ${_bolt.isPowered}"),
                      const Text("Other Data: "),
                    ],
                  ),
                ),
              ),
              ButtonPower(row: row),
            ],
          ),
        ),
      ],
    );
  }
}
