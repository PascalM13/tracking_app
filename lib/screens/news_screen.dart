import 'package:flutter/material.dart';

import '../widgets/UI/news/news_body_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NewsBodyWidget());
  }
}
