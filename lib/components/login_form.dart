import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipy/components/rounded_button.dart';
import 'package:recipy/components/rounded_input.dart';
import 'package:recipy/components/rounded_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultRegisterSize,
    @required this.username,
    @required this.password,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultRegisterSize;

  final TextEditingController username;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 1,
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
                  'Welcome Back',
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
                RoundedPassword(
                  hint: 'Password',
                  controller: password,
                ),
                SizedBox(height: 10),
                RoundedButton(
                  title: 'Login',
                  isLoginScreen: true,
                  username: username,
                  password: password,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
