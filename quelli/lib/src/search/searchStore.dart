class SearchStore {
  CustomLocation location;
  String maxCustomer;
  String name;
  String storeId;
  List<CustomQueue> queue;

  SearchStore({this.location, this.maxCustomer, this.name, this.storeId, this.queue});



  factory SearchStore.fromJson(Map<String, dynamic> json) {
    return SearchStore(
      location: json['location'],
      maxCustomer: json['max_customer'],
      name: json['store_name'],
      storeId: json['store_id'],
      queue: json['queue']
    );
  }
}

class CustomLocation {
  List<int> coordinate;
  String type;

  CustomLocation({this.coordinate, this.type});

  factory CustomLocation.fromJson(Map<String, dynamic> json) {
    return CustomLocation(
      coordinate: json['coordinates'],
      type: json['type']
    );
  }

}

class CustomQueue {
  String queueId;
  String userId;
  String timeslot;
  String status;

  CustomQueue({this.queueId, this.userId, this.timeslot, this.status});


  factory CustomQueue.fromJson(Map<String, dynamic> json) {
    return CustomQueue(
        queueId: json['queue_id'],
        userId: json['user_id'],
        timeslot: json['time_slot'],
        status: json['status'],
    );
  }
}