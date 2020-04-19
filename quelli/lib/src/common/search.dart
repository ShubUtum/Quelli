import 'package:flutter/material.dart';
import 'package:quelli/src/common/service.dart';
import 'package:quelli/src/search/searchObj.dart';

class CustomSearchDelegate extends SearchDelegate {

  final List<String> _history = [];

  List<String> filterName = new List();

  CustomSearchDelegate(){
    //this.filterName = ['hallo'];
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon((Icons.clear)),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //HttpService service = HttpService();
    //String output;
//    service.findStoreInSearch(query).then( (result) => {
//      output = result.stores.length > 0? result.stores[0] : "Not found"
//    });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _history;

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              showResults(context);
              close(context, suggestions[index]);
            },
          );
        });
  }
}
