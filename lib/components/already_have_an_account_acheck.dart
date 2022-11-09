import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_demo/constants.dart';
import 'package:widgetbook_demo/screens/login/login_screen.dart';
import 'package:widgetbook_demo/screens/signup/signup_screen.dart';

@WidgetbookUseCase(name: 'SignUp', type: AlreadyHaveAnAccountCheck)
AlreadyHaveAnAccountCheck signUpCheck(BuildContext context) {
  return AlreadyHaveAnAccountCheck(
    login: false,
    press: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    ),
  );
}

@WidgetbookUseCase(name: 'Login', type: AlreadyHaveAnAccountCheck)
AlreadyHaveAnAccountCheck loginCheck(BuildContext context) {
  return AlreadyHaveAnAccountCheck(
    login: true,
    press: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignUpScreen();
        },
      ),
    ),
  );
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
