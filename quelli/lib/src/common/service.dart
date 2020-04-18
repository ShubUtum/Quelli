import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quelli/src/list/store.dart';

class HttpService {

  //final String url = 'https://localhost:8081/api/v1/';
  final String url = 'https://5e9a5afbbc561b0016af3cca.mockapi.io/api/v1/';

  Future<List<Store>> storeList() async {
    final response =
    await http.get(url + '/store');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Store> stores = body.map((dynamic item) => Store.fromJson(item)).toList();
      return stores;
    } else {
      throw Exception('Something wrong');
    }
  }

  Future<Store> searchStore(query) async {
    final response =
    await http.post(url + '/store/', body: json.encode(query));

    if (response.statusCode == 200) {
      return Store.fromJson(json.decode(response.body));
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
