import 'package:flutter/material.dart';
import 'package:quelli/src/list/store.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({Key key}) : super(key: key);

  @override
  _StoreInfoState createState() => _StoreInfoState();
}

class _StoreInfoState extends State<StoreCard> {
  List<Store> stores = [
    Store(name: 'Victuals Market', location: 'Viktualienmarkt', queue: '3'),
    Store(name:'Japanese delicatessen Mikado', location: 'BaaderstraBe', queue: '6'),
    Store(name:'Da Hapna', location: 'FrauenstraBe', queue: '1'),
    Store(name:'schmatz', location: 'Glockenbachviertel', queue: '0')
  ];

  Widget storeTemplate(store){
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                store.name,
                style: TextStyle(fontSize: 36, color: Colors.black54)
            ),
            SizedBox(height: 12),
            Text(
                store.location,
                style: TextStyle(fontSize: 24, color: Colors.grey)
            ),
            Text(
                store.queue,
                style: TextStyle(fontSize: 18, color: Colors.black38)
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
          children: stores.map((store) => storeTemplate(store)).toList(),
      ),
    );
  }
}
