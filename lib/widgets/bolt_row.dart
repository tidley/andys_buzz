import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
import 'package:andys_buzz/main.dart';
import 'package:andys_buzz/classes/classes.dart';

import 'widgets.dart';

class BoltRows extends ConsumerWidget {
  const BoltRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Bolt> bolts = ref.watch(boltsProvider);
    void toggle1(id) {
      //TODO see if can be used as callback
      ref.read(boltsProvider.notifier).toggle(id);
    }
    // row with three cells.
    // Cell 1 Title of Bolt || Cell 2 Bolt info || Cell 3 on/off
    return Column(
      children: [
        for (final bolt in bolts)
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width / 2.2) - 20,
                child: Card(
                  margin: const EdgeInsets.all(5),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(bolt.id.toString()),
                        Text(bolt.name),
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
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 1.75) - 20,
                child: Row(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(5),
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                                "Location: ${bolt.location}"),
                            const Text("Other Data: "),
                          ],
                        ),
                      ),
                    ),
                    ButtonBoltPower(bolt: bolt),
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
