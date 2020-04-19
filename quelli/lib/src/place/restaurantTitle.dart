import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RestaurantTitle extends StatelessWidget {
  String name;
  String location;
  RestaurantTitle(this.name, this.location);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text(this.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        SizedBox(height: 5),
        Text((double.parse(this.location)/1000).toStringAsFixed(2) + ' km', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}