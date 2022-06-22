import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/history/history_card_widget.dart';

class HistoryBodyWidget extends StatefulWidget {
  const HistoryBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryBodyWidget> createState() => _HistoryBodyWidgetState();
}

class _HistoryBodyWidgetState extends State<HistoryBodyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "History",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          const SizedBox(
            height: 15,
          ),
          HistoryCardWidget(),
          HistoryCardWidget(),
          HistoryCardWidget(),
          HistoryCardWidget(),
          HistoryCardWidget(),
        ],
      ),
    ));
  }
}
