class Store {
  String logo;
  String name;
  String location;
  String queue;

  Store({this.logo, this.name, this.location, this.queue});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      logo: json['logo'],
      name: json['name'],
      location: json['location'],
      queue: json['queue'],
    );
  }
}