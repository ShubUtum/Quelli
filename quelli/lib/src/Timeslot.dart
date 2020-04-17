

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['X', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          margin: EdgeInsets.only(bottom:16.0),
          child:CheckboxListTile(
            title: const Text('Animate Slowly'),
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

