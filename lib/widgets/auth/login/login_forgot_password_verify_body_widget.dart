import 'package:flutter/material.dart';
import 'package:tracking_app/models/auth/change_password_dto.dart';
import 'package:tracking_app/screens/auth/login_screen.dart';
import 'package:tracking_app/services/auth_service.dart';
import 'package:tracking_app/theme/colors.dart';
import 'package:tracking_app/widgets/UI/input_fields/input_field_widget.dart';
import 'package:tracking_app/widgets/UI/rounded_button_widget.dart';
import 'package:tracking_app/widgets/auth/login/login_forgot_password_background_widget.dart';

class LoginForgotPasswordVerifyBodyWidget extends StatefulWidget {
  const LoginForgotPasswordVerifyBodyWidget({Key? key}) : super(key: key);

  @override
  State<LoginForgotPasswordVerifyBodyWidget> createState() =>
      _LoginForgotPasswordVerifyBodyWidgetState();
}

class _LoginForgotPasswordVerifyBodyWidgetState
    extends State<LoginForgotPasswordVerifyBodyWidget> {
  final _verifyController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerificationController = TextEditingController();

  void _changePassword() async {
    if (_passwordController.text != _passwordVerificationController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Both Passwords need to be the same"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    ChangePasswordDto dto = ChangePasswordDto(_emailController.text.trim(),
        _passwordController.text.trim(), _verifyController.text.trim());

    int res = await const AuthService().changePassword(dto);

    if (!mounted) return;

    //If request failed
    if (res == 400) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Wrong Code or Email"),
        backgroundColor: accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }

    //If request was successful
    if (res == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return LoginForgotPasswordBackgroundWidget(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const Text("Enter your Verify-Code",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            hintText: "Verify-Code",
            icon: Icons.security,
            inputController: _verifyController,
            keyboardtType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            hintText: 'Email',
            icon: Icons.mail,
            inputController: _emailController,
            keyboardtType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            hintText: 'New Password',
            icon: Icons.lock,
            inputController: _passwordController,
            keyboardtType: TextInputType.text,
            isPassword: true,
          ),
          const SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            hintText: 'New Password again',
            icon: Icons.lock,
            inputController: _passwordVerificationController,
            keyboardtType: TextInputType.text,
            isPassword: true,
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedButtonWidget(
              text: "Change Password",
              onPress: _changePassword,
              color: accentColor,
              textColor: Colors.white)
        ],
      ),
    ));
  }
}
