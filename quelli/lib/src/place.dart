import 'package:flutter/material.dart';
import 'package:quelli/src/Timeslot.dart';
import 'package:quelli/src/restaurantTitle.dart';

enum ConfirmAction { ACCEPT, CANCEL }

class Place extends StatefulWidget {

  @override
  PlaceState createState() => PlaceState();

}

class PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
           RestaurantTitle(),
           Container(
             height: 300,
             margin: EdgeInsets.only(top: 16, bottom: 16),
             child: TimeSlot()
           ),
           Container(
             child: FloatingActionButton.extended(
                 onPressed: () async {
                   final ConfirmAction action = await _asyncConfirmDialog(context);
                 },
                 label: const Text("Add your queue"),

             )
           )
        ],
      )
    );

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