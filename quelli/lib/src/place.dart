import 'package:flutter/material.dart';
import 'package:quelli/src/Timeslot.dart';
import 'package:quelli/src/restaurantTitle.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: Text('Queue up'),
      ),
      body: Column(
          children: <Widget>[
            RestaurantTitle(),
            TimeSlot()
          ],
        ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {

        }),
        tooltip: 'Queue up this place',

        child: Icon(Icons.play_for_work,
        size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}
