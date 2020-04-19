import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quelli/src/common/search.dart';
import 'package:quelli/src/list/storecard.dart';

class StoreList extends StatefulWidget{
  StoreList({Key key, this.title}) : super(key: key);
  static String tag = 'storelist-page';
  final String title;

  @override
  ListState createState() => ListState();
}

class ListState extends State<StoreList> {
  bool haveQueue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  FloatingActionButton.extended(
        icon: this.haveQueue? Icon(Icons.scanner): Icon(Icons.search),
        label: Text(this.haveQueue? "Check in" : "Search places"), onPressed: () {
          this.haveQueue? print("QR SCANNER HERE") : //QR HERE
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
        );
    },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.person_outline), onPressed: () {},),
            IconButton(icon: Icon(Icons.input), onPressed: () {},),
          ],
        ),
      ),
      appBar: AppBar(
        leading: new Container(),
        title: Text(widget.title),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StoreCard(() => this.setHaveQueue())
          ],
        ),
      ),
    );
  }
  void setHaveQueue(){
    this.haveQueue = true;
    setState(() {});
  }
}