
import 'package:flutter/material.dart';
import 'package:quelli/src/common/service.dart';
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/place/place.dart';
import 'package:geolocator/geolocator.dart';

typedef void QueueCallback();

class StoreCard extends StatefulWidget {
  StoreCard(this.callback);
  QueueCallback callback;
  @override
  _StoreInfoState createState() => _StoreInfoState(() => this.callback());
}

class _StoreInfoState extends State<StoreCard> {
  Image image;
  var _currentPosition;
  QueueCallback callback;
  final HttpService httpService = HttpService();
  final List<Widget> collections = new List<Widget>();

  List<Store> stores = new List<Store>();

  _StoreInfoState(this.callback);

  _getStores() async {
    httpService.storeList(_currentPosition).then((response) {
      setState(() {
        stores = response;
        print(stores);
      });
    });
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  initState() {
    super.initState();
    _getCurrentLocation();
    _getStores();
  }

  Widget storeTemplate(store){
    return
        Card(
          margin: EdgeInsets.all(10),
          elevation: 4,
          child: new InkWell(
            onTap: () {
            _settingModalBottomSheet(context, store);
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
          children: <Widget>[
            new SizedBox(
              width: 100.0,
              child: new Image(
                image: new NetworkImage('http://35.234.115.144:3000/test/storeImage?store_id=' + store.storeid),
                fit: BoxFit.fitHeight
              )
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(store.name.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on, size: 20, color: Colors.grey),
                      ),
                      TextSpan(text: (store.location/1000).toStringAsFixed(2) + ' km', style: TextStyle(color: Colors.green))
                    ]
                  ),
                ),
                Row(
                  children: <Widget>[
                   Column(
                      children: <Widget> [
                        SizedBox(height: 25),
                        Text('Queue today ' , style: TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.right),
                        Text(store.queue.length.toString(), style: TextStyle(fontSize: 16, color: Colors.black87), textAlign: TextAlign.right)
                      ]
                    ),
                    SizedBox(width: 50),
                    Column(
                        children: <Widget> [
                          SizedBox(height: 25),
                          Text('Queue ahead ' , style: TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.right),
                          Text(store.queue.length.toString(), style: TextStyle(fontSize: 16, color: Colors.black87), textAlign: TextAlign.right)
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
  
    stores.map((store) => storeTemplate(store)).toList().forEach((widget) => collections.add(widget));
    
    return Container(
      child:Column(
          children: collections,
      ),
    );
  }

  void _settingModalBottomSheet(context, store){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Place(store, (val) => addQueue(val));
        }
    );
  }

  void addQueue(slot){
    collections.insert(0, queueTemplate(slot));
    this.callback();
    setState(() {});
  }

  createAlertDialog(BuildContext context, userid, storeid, queueid){
    return showDialog(context: context, barrierDismissible: true, builder: (context){
      return AlertDialog(
        title: Text("Your QR Code for this store"),
        content: Image.network('http://35.234.115.144:3000/qrtest/requestQR?user_id='+ userid +'&store_id=' + storeid + '&queue_id=' + queueid),
        actions: <Widget>[
          FlatButton(
            child: Text('Close'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
        elevation: 24.0,
      );
    });
  }
  
  Widget queueTemplate(slot){
    print(slot.time);
    print(slot.name);

    return Center( child:Container(
        //color: Colors.blue[700],
        margin: EdgeInsets.all(10),
        child: new InkWell(
            onTap: () { //To be route to queuing page
              createAlertDialog(context, '001', '5e99e8bc86c608d010863b27', '2b1a9a89-f76e-4aeb-ba2e-42043e6de302');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align( alignment: Alignment.centerLeft, child: const Text("Your next queue is at", style: TextStyle(fontFamily: "helvetica neue"))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(slot.time, style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold, fontFamily: "helvetica neue"))),
                        SizedBox(height: 1),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Text(slot.name, style: TextStyle (fontSize: 16, fontFamily: "helvetica neue"))
                        ),
                      ]
                  ),
            )
        )
    ));
  }
}
