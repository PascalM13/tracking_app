class NewsModel {
  final int id;
  final String createdAt;
  final String updatedAt;
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
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        title: json['title'],
        text: json['text']);
  }

  String getDateString() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(updatedAt));
    String date =
        "${dateTime.hour}:${dateTime.minute} - ${dateTime.day}.${dateTime.month}.${dateTime.year}";
    return date;
  }
}
