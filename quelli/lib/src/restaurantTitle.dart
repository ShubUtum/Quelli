import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32.0, bottom: 16.0),
              child:
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.brown.shade800,
                child: Text('RE'),
            )),
            const Text("What a good restaurant", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 5),
            const Text("Am Michaelianger 2, Oberschleissheim", style: TextStyle(color: Colors.grey, fontSize: 14)),
            SizedBox(height: 5),
            const Text("Closed - Open at 11:00-19:00", style: TextStyle(color:Colors.redAccent, fontSize: 12))
      ],
    ))
    ;

  }
}