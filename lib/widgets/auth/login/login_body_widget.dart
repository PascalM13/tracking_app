import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tracking_app/models/dto/login_dto.dart';
import 'package:tracking_app/screens/auth/register_screen.dart';
import 'package:tracking_app/services/auth/login_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/auth/login/login_background_widget.dart';
import '../../UI/input_fields/input_field_widget.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({Key? key}) : super(key: key);

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  final _emailController = TextEditingController();
  final _passwordController =
      TextEditingController(); //default is true, to not display error message

  Future<void> _login() async {
    LoginDto dto =
        LoginDto(_emailController.text.trim(), _passwordController.text.trim());
    Response? res = await const LoginService().login(dto);

    if (!mounted) return;
    if (res != null) {
      if (res.statusCode == 201) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/', ModalRoute.withName('/welcome'));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Email already exists"),
          backgroundColor: accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          behavior: SnackBarBehavior.floating,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("No Connection"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Hey there,",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                  fontSize: 14)),
          const Text("Welcome Back!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          Image.asset(
            'assets/images/login_screen.jpg',
            height: size.height * 0.3,
          ),
          InputFieldWidget(
              hintText: "Email",
              icon: Icons.mail,
              inputController: _emailController,
              keyboardtType: TextInputType.emailAddress),
          const SizedBox(
            height: 15,
          ),
          InputFieldWidget(
              hintText: "Passwort",
              icon: Icons.lock,
              inputController: _passwordController,
              keyboardtType: TextInputType.text,
              isPassword: true),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: 'Login',
              onPress: () => {_login()},
              color: accentColor,
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Don't have an account?  ",
                  style: TextStyle(color: accentColor)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }));
                },
                child: const Text(
                  "Click here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: accentColor),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
