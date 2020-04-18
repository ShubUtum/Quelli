import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
          children: <Widget>[
            SizedBox(height: 16),
            const Text("What a good restaurant", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            SizedBox(height: 5),
            const Text("Am Michaelianger 2, Oberschleissheim", style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
   );


  }
}