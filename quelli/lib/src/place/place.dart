import 'package:flutter/material.dart';
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/place/Timeslot.dart';
import 'package:quelli/src/place/restaurantTitle.dart';
import 'package:quelli/src/place/slot.dart';

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
  final SlotCallback callback;
  final List<String> entries = <String>['X', 'B', 'C','D','E'];
  PlaceState(this.store, this.callback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
           RestaurantTitle(this.store.name, this.store.location),
           Expanded(
             child: TimeSlot(entries, (time) => onSelectSlot(time))
           ),
           Container(
             margin: EdgeInsets.only(top: 16.0),
             child: FloatingActionButton.extended(
                 onPressed: () async {
                   final ConfirmAction action = await _asyncConfirmDialog(context);
                   if (action == ConfirmAction.ACCEPT){
                     this.callback(Slot.create(this.store.name, null, null));
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

  }

  void onRemoveSlot(String time){

  }

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset settings?'),
          content: const Text(
              'This will reset your device to its default factory settings.'),
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