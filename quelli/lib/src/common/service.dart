import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quelli/src/list/store.dart';
import 'package:quelli/src/search/searchObj.dart';

class HttpService {

  //final String url = 'https://localhost:8081/api/v1/';
  final String url = 'https://5e9a5afbbc561b0016af3cca.mockapi.io/api/v1/';
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

//  Future<Time> TimeSlot() async {
//    final response =
//    await http.post(url + 'albums/1');
//
//    if (response.statusCode == 200) {
//      return Store.fromJson(json.decode(response.body));
//    } else {
//      throw Exception('Failed to load album');
//    }
//  }
//
//  Future<class> something() async {
//    final response =
//    await http.post(url + 'albums/1');
//
//    if (response.statusCode == 200) {
//      return Store.fromJson(json.decode(response.body));
//    } else {
//      throw Exception('Failed to load album');
//    }
//  }
}
