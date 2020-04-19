import 'package:quelli/src/search/searchStore.dart';

class StoreObj {
  String keyword;
  List<SearchStore> stores;

  StoreObj({this.keyword, this.stores});


  factory StoreObj.fromJson(Map<String, dynamic> json) {
    return StoreObj(
      keyword: json['search_text'],
      stores: json['stores'],
    );
  }
}