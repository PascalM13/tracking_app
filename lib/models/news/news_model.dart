/// Class which represents the NewsModel
///
/// @author: PascalM13
class NewsModel {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String title;
  final String text;
  final String author;

  NewsModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.text,
      required this.author});

  /// Factory Method for parsing a Json Activity-Object to an object of type NewsModel
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        id: json['id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        title: json['title'],
        text: json['text'],
        author: json['user_firstname'] + " " + json['user_lastname']);
  }

  /// Function to get a String from date
  String getDateString() {
    String date = updatedAt.split("T")[0];
    return date;
  }
}
