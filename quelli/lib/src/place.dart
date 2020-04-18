import 'package:flutter/material.dart';
import 'package:quelli/src/Timeslot.dart';
import 'package:quelli/src/restaurantTitle.dart';

enum ConfirmAction { ACCEPT, CANCEL }

class Place extends StatefulWidget {
  @override
  Widget build(BuildContext context) {

  }

  @override
  PlaceState createState() => PlaceState();

}

class PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
        children: <Widget>[Column(
          children: <Widget>[
            RestaurantTitle(),
            Container(
              height: 300,
              margin: EdgeInsets.only(top:16, bottom: 16),
              child: TimeSlot()
          ),
            Container(

              child: FloatingActionButton.extended(
                elevation: 4.0,
                icon: const Icon(Icons.add),
                label: const Text('Add your queue'),
                onPressed: () async {
                  final ConfirmAction action = await _asyncConfirmDialog(context);
                  print("Confirm Action $action");
                },
            )),
            SizedBox(height: 32)
          ],
    ),
        ]
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