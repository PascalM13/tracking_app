import 'package:flutter/material.dart';
import 'package:tracking_app/screens/profile_change_screen.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/background/screen_background_widget.dart';
import 'package:tracking_app/widgets/UI/logout_button_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';

import '../../../models/user/user_model.dart';

class ProfileBodyWidget extends StatefulWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  State<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  //variables which have to be filled with database
  String _firstname = '';
  String _lastname = '';
  String _dateofbirth = '';
  String _gender = '';

  String _height = '';
  String _weight = '';
  String _address = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  /*refresh() async {
    setState(() {
      _getUser();
    });
  }*/
  void _changeProfile() {
    setState(() {
      _getUser();
    });
  }

  void _getUser() async {
    UserModel tmp = await UserModel().getCurrentUser();
    setState(() {
      //_firstname = tmp.firstName!;
      //_lastname = tmp.lastName!;
      if (tmp.firstName == null || tmp.firstName == '') {
        _firstname = '---';
      } else {
        _firstname = tmp.firstName.toString();
      }
      if (tmp.lastName == null || tmp.lastName == '') {
        _lastname = '---';
      } else {
        _lastname = tmp.lastName.toString();
      }
      if (tmp.birthday == null) {
        _dateofbirth = '---';
      } else {
        _dateofbirth = tmp.birthday.toString();
      }
      if (tmp.gender == null) {
        _gender = '---';
      } else {
        _gender = tmp.gender.toString();
      }
      if (tmp.address == null) {
        _address = '---';
      } else {
        _address = tmp.address.toString();
      }

      if (tmp.height == null) {
        _height = '---';
      } else {
        _height = tmp.height.toString();
      }
      if (tmp.weight == null) {
        _weight = '---';
      } else {
        _weight = tmp.weight.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle_rounded,
                  color: secondery, size: 75),
              RoundedButtonWidget(
                text: 'Refresh',
                onPress: () {
                  _changeProfile();
                },
                color: accentColor,
                textColor: Colors.white,
                buttonWidth: 0.4,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Firstname:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Lastname:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Date of birth:',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
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
                      child: Text(
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
                    Text(
                      'Height(cm):',
                      style: TextStyle(
                        height: 2.5,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
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
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _firstname,
                      style: const TextStyle(
                        height: 2.5,
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _lastname,
                      style: const TextStyle(
                        height: 2.5,
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _dateofbirth,
                      style: const TextStyle(
                        height: 2.5,
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _gender,
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
                        _address,
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
                      _height,
                      style: const TextStyle(
                        height: 2.5,
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _weight,
                      style: const TextStyle(
                        height: 2.5,
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
