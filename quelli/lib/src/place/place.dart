import 'package:flutter/material.dart';
import 'package:quelli/src/common/service.dart';
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/place/Timeslot.dart';
import 'package:quelli/src/place/restaurantTitle.dart';
import 'package:quelli/src/place/slot.dart';
import 'package:intl/intl.dart';

enum ConfirmAction { ACCEPT, CANCEL }


typedef void SlotCallback(Slot val);

class Place extends StatefulWidget {
  Store store;
  final SlotCallback callback;
  Place(this.store, this.callback);
  @override
  PlaceState createState() => PlaceState(this.store, this.callback);

}

class PlaceState extends State<Place> {
  Store store;
  final HttpService httpService = HttpService();
  final SlotCallback callback;
  final List<String> entries = <String>['14:00', '14:30', '15:00','15:30','16:00','16:30','17:00','17:30','18:00','18:30','19:30','20:00'];
  List<String> timeSlot = new List<String>();
  PlaceState(this.store, this.callback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
           RestaurantTitle(this.store.name, this.store.location.toString()),
           Expanded(
             child: TimeSlot(entries, (time) => onSelectSlot(time))
           ),
           Container(
             margin: EdgeInsets.only(top: 16.0),
             child: FloatingActionButton.extended(
                 onPressed: () async {
                   final ConfirmAction action = await _asyncConfirmDialog(context);
                   if (action == ConfirmAction.ACCEPT){
                     var date = new DateFormat('yyymmdd').format(new DateTime.now()).toString();
                     var time = this.timeSlot[0].split(':');
                     var timesection = int.parse(time[0]) * 2;
                     if(time[1] != '00'){timesection += 1;}
                     var id = await httpService.joinqueue(this.store.storeid, '001', date + timesection.toString());
                     this.callback(Slot.create(this.store.name, this.timeSlot[0], this.store.storeid, id, timesection.toString()));
                     Navigator.pop(context);
                   }
                 },
                 label: const Text("Add your queue"),

             )
           ),
          SizedBox(height: 30)
        ],
      )
    );

  }

  void onSelectSlot(Map<String, bool> time){
    time.keys.forEach((key) => {
      if (time[key])
        this.timeSlot.add(key)
    });

  }

  void onRemoveSlot(String time){

  }

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Comfirm your pick?'),
          content: const Text(
              'Are you sure about your picked time?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }
}