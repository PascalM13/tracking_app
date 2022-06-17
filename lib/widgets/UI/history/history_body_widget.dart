import 'package:flutter/material.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/history/table_activity_widget';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_dropdown_activity_widget.dart';

class HistoryBodyWidget extends StatefulWidget {
  const HistoryBodyWidget({Key? key}) : super(key: key);

  @override
  State<HistoryBodyWidget> createState() => _HistoryBodyWidgetState();
}

class _HistoryBodyWidgetState extends State<HistoryBodyWidget> {
  String? activity;
  bool isVisible = false;

  // Function to pass to set the state of gender
  void _setActivity(String dropDownValue) {
    setState(() {
      activity = dropDownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          RoundedDropdownActivityWidget(
            setActivity: _setActivity,
          ),
          if (activity == 'Sonstiges')
            Column(
              children: [
                const InputFieldWidget(
                  hintText: "Bezeichnung der Aktivität",
                  icon: Icons.abc_rounded,
                ),
              ],
            ),
          RoundedButtonWidget(
              text: 'Start activity',
              onPress: () {
                print(activity);
              },
              color: accentColor,
              textColor: Colors.white),
          const SizedBox(
            height: 40,
          ),
          const Text("My last activities:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const SizedBox(
            height: 30,
          ),
          const Text("Fahrrad fahren: 15 min, 3 km, 900 steps, 400 kcal",
              style: TextStyle(color: Colors.black87, fontSize: 14)),
          const SizedBox(
            height: 15,
          ),
          const Text("Wandern: 120 min, 10 km, 10000 steps, 2000 kcal",
              style: TextStyle(color: Colors.black87, fontSize: 14)),
          TableActivityWidget(),
        ],
      ),
    ));
  }
}
