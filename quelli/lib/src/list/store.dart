class Store {
  String logo;
  String name;
  double location;
  String storeid;
  List<dynamic> queue;

  Store({this.logo, this.storeid, this.name, this.location, this.queue});
  Store.fromSlot(this.name, this.location, this.queue, this.storeid);


  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      logo: json['logo'],
      name: json['name'],
      storeid: json['store_id'],
      location: json['distance'],
      queue: json['queue'],
    );
  }
}

//class CustomQue {
//  String queueid;
//  String userid;
//  int timeslot;
//  CustomQue({this.queueid, this.userid, this.timeslot});
//
//  factory CustomQue.fromJson(Map<String, dynamic> json) {
//    return CustomQue(
//      queueid: json['queue_id'],
//      userid: json['user_id'],
//      timeslot: json['time_slot'],
//    );
//  }
//}