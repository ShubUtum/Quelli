
class Slot {
  String name;
  String time;
  String queue;

  Slot({this.name, this.time, this.queue});
  Slot.create(this.name, this.time, this.queue);

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      name: json['name'],
      time: json['time'],
      queue: json['queue'],
    );
  }
}