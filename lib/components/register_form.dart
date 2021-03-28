import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipy/components/rounded_button.dart';
import 'package:recipy/components/rounded_input.dart';
import 'package:recipy/components/rounded_password.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultRegisterSize,
    @required this.username,
    @required this.name,
    @required this.password,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultRegisterSize;

  final TextEditingController username;
  final TextEditingController name;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 4,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: defaultRegisterSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 40),
                  SvgPicture.asset(
                    'assets/images/login.svg',
                    width: 300,
                  ),
                  SizedBox(height: 40),
                  RoundedInput(
                    hint: 'Username',
                    icon: Icons.email,
                    controller: username,
                  ),
                  RoundedInput(
                    hint: 'Name',
                    icon: Icons.face_rounded,
                    controller: name,
                  ),
                  RoundedPassword(
                    hint: 'Password',
                    controller: password,
                  ),
                  SizedBox(height: 10),
                  RoundedButton(
                    title: 'Sign up',
                    isLoginScreen: false,
                    username: username,
                    name: name,
                    password: password,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
