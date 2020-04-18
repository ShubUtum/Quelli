
import 'package:flutter/material.dart';
import 'package:quelli/src/common/service.dart';
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/place/place.dart';

typedef void QueueCallback();

class StoreCard extends StatefulWidget {
  StoreCard(this.callback);
  QueueCallback callback;
  @override
  _StoreInfoState createState() => _StoreInfoState(() => this.callback());
}

class _StoreInfoState extends State<StoreCard> {
  Image image;
  QueueCallback callback;
  final HttpService httpService = HttpService();
  final List<Widget> collections = new List<Widget>();

  List<Store> stores = new List<Store>();

  _StoreInfoState(this.callback);

  _getStores() {
    httpService.storeList().then((response) {
      setState(() {
        stores = response;
        print(stores);
      });
    });
  }

  initState() {
    super.initState();
    _getStores();
  }

  Widget storeTemplate(store){
    return
        Card(
          margin: EdgeInsets.all(10),
          elevation: 4,
          child: new InkWell(
            onTap: () { //To be route to queuing page
            print("tapped");
            _settingModalBottomSheet(context, store);
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
  
  Widget queueTemplate(slot){
    print(slot.time);
    print(slot.name);

    return Center( child:Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: new InkWell(
            onTap: () { //To be route to queuing page
              print("tapped");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child:
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text("Your queue is at"),
                        Text(slot.time, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, )),
                        SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.location_on, size: 24, color: Colors.grey),
                                ),
                                TextSpan(text: slot.name, style: TextStyle(color: Colors.green, fontSize: 12))
                              ]
                          ),
                        ),
                      ]
                  ),


            )
        )
    ));
  }
}
