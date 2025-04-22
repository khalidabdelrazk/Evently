class Event {
  static const String collectionName = 'Event';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavourite;

  Event({
    this.id = '',
    required this.image,
    required this.title,
    required this.description,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isFavourite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "title": title,
      "description": description,
      "eventName": eventName,
      "dateTime": dateTime.millisecondsSinceEpoch,
      "time": time,
      "isFavourite": isFavourite,
    };
  }

  Event.toObject(Map<String, dynamic> data)
    : this(
        id: data["id"],
        image: data["image"],
        title: data["title"],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
        description: data["description"],
        eventName: data["eventName"],
        time: data["time"],
        isFavourite: data["isFavourite"],
      );
}
