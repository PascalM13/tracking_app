import 'package:flutter/material.dart';
import 'package:tracking_app/screens/profile_change_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/logout_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../../../models/user/user_model.dart';

/// Widget-class for displaying the body with attributes of the User
class ProfileBodyWidget extends StatefulWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  State<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  /// Helper Function the display the User Date as String from TimeStamp
  displayBirthday(int timeStamp) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return "${dt.day}.${dt.month}.${dt.year}";
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "My Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentColor,
                fontSize: 25.0),
          ),
          const SizedBox(
            height: 15,
          ),
          const Icon(
            Icons.account_circle_rounded,
            size: 70,
            color: accentColor,
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Firstname:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Lastname:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Date of birth:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Gender:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 50,
                      width: 80,
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Address:',
                        style: TextStyle(
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                          fontSize: 15.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      'Height(cm):',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Weight(kg):',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                FutureBuilder(
                    future: UserModel().getCurrentUser(),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserModel> snapshot) {
                      List<Widget> children;
                      if (snapshot.hasData) {
                        children = <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.firstName!,
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                snapshot.data!.lastName!,
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                snapshot.data!.birthday == null
                                    ? "---"
                                    : displayBirthday(snapshot.data!.birthday!),
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                snapshot.data!.gender == null
                                    ? "---"
                                    : snapshot.data!.gender!,
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.data!.address == null
                                      ? "---"
                                      : snapshot.data!.address!,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(
                                    height: 0,
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                snapshot.data!.height == null
                                    ? "---"
                                    : snapshot.data!.height!.toString(),
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                snapshot.data!.weight == null
                                    ? "---"
                                    : snapshot.data!.weight!.toString(),
                                style: const TextStyle(
                                  height: 2.5,
                                  color: Colors.black,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ];
                      } else {
                        children = <Widget>[Text("Loading...")];
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: children,
                        ),
                      );
                    })
              ],
            ),
          ),
          RoundedButtonWidget(
              text: 'Edit personal information',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileChangeScreen();
                }));
              },
              color: accentColor,
              textColor: Colors.white),
          const LogoutButtonWidget(),
        ],
      ),
    ));
  }
}
