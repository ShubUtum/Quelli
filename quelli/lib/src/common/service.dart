import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/search/searchObj.dart';

class HttpService {
  final String apiurl = 'http://35.234.115.144:3000/';

  Future<List<Store>> storeList(position) async {
    var combineurl = apiurl + 'nearestStore' + '/11.605305' + '/48.159427' + '/5';
    final response =
    await http.get(combineurl);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(body);
      List<Store> stores = body.map((dynamic item) => Store.fromJson(item)).toList();
      print(stores);
      return stores;
    } else {
      throw Exception('Something wrong');
    }
  }

  Future<StoreObj> findStoreInSearch(String keyword) async {
    final response =
        await http.get("http://35.234.115.144:3000/store/?text=" + keyword + "&limit=10");

    if (response.statusCode == 200) {
      return StoreObj.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Store> searchStore(query) async {
    final response =
    await http.get(apiurl + 'searchstore/');

    if (response.statusCode == 200) {
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> joinqueue(storeid, userid, timeslot) async {
    final response =
    await http.put(apiurl + 'store/queue/', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{'store_id': storeid, 'user_id': userid, 'time_slot': timeslot})
    );

    if (response.statusCode == 200) {
      return QueId.fromJson(json.decode(response.body)).id;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<dynamic> getQRCode(userid, storeid, queueid) async {
    var queryParameters = {
      'user_id': userid,
      'store_id': storeid,
      'queue_id': queueid
    };
    var uri = Uri.https(apiurl, 'qrtest/requestQR/', queryParameters);
    final response =
    await http.post(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }
}

class QueId {
  String id;

  QueId({this.id});

  factory QueId.fromJson(Map<String, dynamic> json) {
    return QueId(
      id: json['queue_id'],
    );
  }
}
