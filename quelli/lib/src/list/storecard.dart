import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:quelli/src/common/service.dart';
import 'package:quelli/src/list/store.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({Key key}) : super(key: key);

  @override
  _StoreInfoState createState() => _StoreInfoState();
}

class _StoreInfoState extends State<StoreCard> {
  Image image;
  final HttpService httpService = HttpService();

  List<Store> stores = new List<Store>();

  _getStores() {
    httpService.storeList().then((response) {
      setState(() {
        stores = response;
      });
    });
  }

  initState() {
    super.initState();
    _getStores();
  }

  Widget storeTemplate(store){
    return Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: new InkWell(
          onTap: () { //To be route to queuing page
          print("tapped");
        },
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
        children: <Widget>[
          Image.network(store.logo), //must decode
//          CircleAvatar(
//            radius:60,
//          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(store.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(Icons.location_on, size: 20, color: Colors.grey),
                    ),
                    TextSpan(text: store.location, style: TextStyle(color: Colors.green))
                  ]
                ),
              ),
              Row(
                children: <Widget>[
                 Column(
                    children: <Widget> [
                      SizedBox(height: 25),
                      Text('Queue today ' , style: TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.right),
                      Text(store.queue, style: TextStyle(fontSize: 16, color: Colors.black87), textAlign: TextAlign.right)
                    ]
                  ),
                  SizedBox(width: 50),
                  Column(
                      children: <Widget> [
                        SizedBox(height: 25),
                        Text('Queue ahead ' , style: TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.right),
                        Text(store.queue, style: TextStyle(fontSize: 16, color: Colors.black87), textAlign: TextAlign.right)
                      ]
                  )
                ],
              )
              ]
          ),
          ],
        ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
          children: stores.map((store) => storeTemplate(store)).toList(),
      ),
    );
  }
}