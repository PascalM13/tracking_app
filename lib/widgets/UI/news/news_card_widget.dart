import 'package:flutter/material.dart';
import 'package:tracking_app/models/news/news_model.dart';
import 'package:tracking_app/screens/news_info_screen.dart';

/// Widget-class to display the News from DB as a Card
class NewsCardWidget extends StatefulWidget {
  final NewsModel newsModel;
  const NewsCardWidget({Key? key, required this.newsModel}) : super(key: key);

  @override
  State<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: (size.height * 0.02)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsInfoScreen(
                newsModel: widget.newsModel,
              );
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/scientist.png'),
                  ),
                  title: Text(
                    widget.newsModel.title,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: "${widget.newsModel.author}  ",
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                        const WidgetSpan(
                          child: Icon(
                            Icons.calendar_month,
                            size: 16,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: widget.newsModel.getDateString(),
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
