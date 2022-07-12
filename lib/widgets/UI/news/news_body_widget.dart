import 'package:flutter/material.dart';
import 'package:tracking_app/models/news/news_model.dart';
import 'package:tracking_app/screens/news_screen.dart';
import 'package:tracking_app/services/news_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/news/news_card_widget.dart';

class NewsBodyWidget extends StatefulWidget {
  const NewsBodyWidget({Key? key}) : super(key: key);

  @override
  State<NewsBodyWidget> createState() => _NewsBodyWidgetState();
}

class _NewsBodyWidgetState extends State<NewsBodyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.10, bottom: size.height * 0.10),
        child: Column(
          children: [
            const Text(
              "News",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: accentColor),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            FutureBuilder(
                future: const NewsService().getNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      for (NewsModel news in snapshot.data!.reversed)
                        NewsCardWidget(newsModel: news),
                    ];
                  } else if (snapshot.hasError) {
                    children = <Widget>[
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Error: Failed to load Activities'),
                      )
                    ];
                  } else {
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ];
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: children,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
