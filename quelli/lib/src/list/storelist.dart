import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quelli/src/list/storecard.dart';

class StoreList extends StatefulWidget{
  StoreList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  ListState createState() => ListState();
}

class ListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'User Profile',
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StoreCard()
          ],
        ),
      ),
    );
  }
}