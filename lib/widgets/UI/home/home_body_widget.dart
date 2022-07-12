import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/home/expansion_panel_list_widget.dart';
import 'package:tracking_app/widgets/UI/home/percent_indicator_days_widget.dart';

import '../../../models/news/news_model.dart';
import '../../../models/project/project_model.dart';
import '../../../services/news_service.dart';
import '../../../services/project_service.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  final Future<List<NewsModel>> _newsList = const NewsService().getNews();
  String _studyname = "";
  List allNews = [];

  void _getStudy() async {
    ProjectModel project = await const ProjectService().getProject();
    //List<NewsModel> news = await const UniversityService().getNews();

    setState(() {
      _studyname = project.name;
    });
  }

  @override
  void initState() {
    super.initState();
    _getStudy();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          const Text(
            "Welcome to the study",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: accentColor,
              fontSize: 25.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              _studyname,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black45,
                fontSize: 21.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Duration of the study:',
            style: TextStyle(
              height: 2.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          const PercentIndicatorDayWidget(),
          /*const SizedBox(
            height: 15,
          ),*/
          //const PercentIndicatorActivityWidget(),
          const SizedBox(
            height: 15,
          ),

          const Text(
            'Latest news:',
            style: TextStyle(
              height: 2.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),

          Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1.5)),
              child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: _newsList,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<NewsModel>> snapshot) {
                        List<Widget> children;
                        if (snapshot.hasData) {
                          children = <Widget>[
                            for (NewsModel news in snapshot.data!.reversed)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Column(
                                  children: [
                                    const Divider(
                                        color: Colors.black45, thickness: 1),
                                    Text(
                                      news.title,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "created at: ${news.createdAt.substring(0, 10)}, by: ${news.author}",
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      news.text,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Divider(
                                        color: Colors.black45, thickness: 1),
                                  ],
                                ),
                              ),
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
                              child: Text('Error: Failed to load News'),
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
                      }))),
          const SizedBox(
            height: 15,
          ),
          const ExpansionPanelListWidget(),
        ],
      ),
    ));
  }
}
