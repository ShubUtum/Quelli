import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quelli/src/list/storecard.dart';

class List extends StatefulWidget{
  List({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ListState createState() => ListState();
}

class ListState extends State<List> {

  void _dosomething() {
//    setState(() {
//    });
      print('done');
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreCard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dosomething,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}