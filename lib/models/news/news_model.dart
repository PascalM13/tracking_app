class NewsModel {
  final int id;
  final int createdAt;
  final int updatedAt;
  final String title;
  final String text;

  NewsModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.text});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: json['id'],
        createdAt: int.parse(json['created_at']),
        updatedAt: int.parse(json['updated_at']),
        title: json['title'],
        text: json['text']);
  }

  String getDateString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(updatedAt);
    String date =
        "${dateTime.hour}:${dateTime.minute} - ${dateTime.day}.${dateTime.month}.${dateTime.year}";
    return date;
  }
}
