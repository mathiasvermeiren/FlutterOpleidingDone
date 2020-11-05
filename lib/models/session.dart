class Session {
  String key;
  String title;
  String timeSlot;
  String intro;
  String description;
  String thumbnailUrl;
  String imageUrl;

  Session(
      {this.key,
      this.title,
      this.timeSlot,
      this.intro,
      this.description,
      this.thumbnailUrl,
      this.imageUrl});

  Session.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        timeSlot = json['timeSlot'],
        intro = json['intro'],
        description = json['description'],
        thumbnailUrl = json['thumbnailUrl'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'timeSlot': timeSlot,
        'intro': intro,
        'description': description,
        'thumbnailUrl': thumbnailUrl,
        'imageUrl': imageUrl,
      };
}
