import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';

import '../models/news/news_model.dart';

class NewsInfoScreen extends StatefulWidget {
  final NewsModel newsModel;
  const NewsInfoScreen({Key? key, required this.newsModel}) : super(key: key);

  @override
  State<NewsInfoScreen> createState() => _NewsInfoScreenState();
}

class _NewsInfoScreenState extends State<NewsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: secondery,
            child: Container(
                height: size.height * 0.15,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: size.height * 0.045),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/scientist.png'),
                  ),
                )),
          ),
          Container(
              color: secondery,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: size.height * 0.02),
              child: Column(
                children: [
                  Text(
                    "${widget.newsModel.title}  ",
                    style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            Icons.person,
                            size: 24,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: "${widget.newsModel.author}  ",
                          style: const TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                        const WidgetSpan(
                          child: Icon(
                            Icons.calendar_month,
                            size: 24,
                            color: Colors.black54,
                          ),
                        ),
                        TextSpan(
                          text: widget.newsModel.getDateString(),
                          style: const TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
                left: size.width * 0.04, right: size.width * 0.04),
            child: Text(
              widget.newsModel.text,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
          )
        ]),
      ),
    );
  }
}
