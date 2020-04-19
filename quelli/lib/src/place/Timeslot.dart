

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


typedef void TimeSlotCallback(Map<String,bool> val);

class TimeSlot extends StatefulWidget {
  TimeSlot(this.timeslots, this.callback);
  TimeSlotCallback callback;
  List<String> timeslots;

  @override
  TimeSlotState createState() => TimeSlotState(this.timeslots, this.callback);
}

class TimeSlotState extends State<TimeSlot> {
  Map<String, bool> report;

  TimeSlotState(this.timeslots, this.callback){
    print("test");
    print(timeslots);
    checkbox = new List<bool>();
    timeslots.forEach( (element) => checkbox.add(false));
    report =  new Map<String, bool>();
  }
  List<bool> checkbox;
  List<String> timeslots;
  TimeSlotCallback callback;


  @override
  Widget build(BuildContext context) {

    final List<int> colorCodes = <int>[600, 500, 100];
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left:16.0, right:16.0, bottom:16.0),
      itemCount: this.timeslots.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 30,
            margin: EdgeInsets.only(top:16.0, bottom: 16.0),
            child:CheckboxListTile(
              title: Text(this.timeslots[index]),
              value: this.checkbox[index],
              onChanged: (bool value) {
                report[this.timeslots[index]] = value;
                this.checkbox[index] = value;
                this.callback(this.report);
                setState(() {});
              },

            )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

  }

}

