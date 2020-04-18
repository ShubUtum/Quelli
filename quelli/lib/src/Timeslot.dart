

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['X', 'B', 'C','D','E'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left:16.0, right:16.0, bottom:16.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 60,
          margin: EdgeInsets.only(top:16.0),
          child:CheckboxListTile(
            title: const Text('Time Slot na ja'),
            value: timeDilation != 1.0,
            onChanged: (bool value) {

            },
            subtitle: const Text('10 slots left'),
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

  }
}

