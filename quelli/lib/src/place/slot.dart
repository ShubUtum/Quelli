
class Slot {
  String name;
  String time;
  String queue;
  String storeid;
  String timesection;

  Slot({this.name, this.time, this.storeid, this.queue, this.timesection});
  Slot.create(this.name, this.time, this.storeid, this.queue, this.timesection);

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      name: json['name'],
      time: json['time'],
      storeid: json['storeid'],
      queue: json['queue'],
      timesection: json['timesection'],
    );
  }
}