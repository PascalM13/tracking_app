import 'package:flutter/material.dart';
import 'package:tracking_app/services/auth_service.dart';

import '../../../theme/colors.dart';
import '../../UI/input_fields/input_field_widget.dart';
import '../../UI/rounded_button_widget.dart';

class VerifyBodyWidget extends StatefulWidget {
  const VerifyBodyWidget({Key? key}) : super(key: key);

  @override
  State<VerifyBodyWidget> createState() => _VerifyBodyWidgetState();
}

class _VerifyBodyWidgetState extends State<VerifyBodyWidget> {
  final _emailController = TextEditingController();
  final _verifyController = TextEditingController();

  Future<void> _verify() async {
    int res = await const AuthService().confirmEmail(
        _emailController.text.trim(), _verifyController.text.trim());

    if (!mounted) return;

    if (res == 201) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/', ModalRoute.withName('/welcome'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Wrong Email or Code"),
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
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
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
                    hintText: "Email",
                    icon: Icons.mail,
                    inputController: _emailController,
                    keyboardtType: TextInputType.emailAddress),
                const SizedBox(
                  height: 15,
                ),
                InputFieldWidget(
                  hintText: "Verify-Code",
                  icon: Icons.security,
                  inputController: _verifyController,
                  keyboardtType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                RoundedButtonWidget(
                    text: 'Verify',
                    onPress: () => {_verify()},
                    color: accentColor,
                    textColor: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}
