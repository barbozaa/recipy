import 'package:flutter/material.dart';
import 'package:recipy/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.title,
    @required this.isLoginScreen,
    @required this.username,
    this.name,
    @required this.password,
  }) : super(key: key);

  final String title;
  final bool isLoginScreen;
  final TextEditingController username;
  final TextEditingController name;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (isLoginScreen) {
          print(username.text);
          print(password.text);
          print(isLoginScreen);
        } else {
          print(username.text);
          print(name.text);
          print(password.text);
          print(isLoginScreen);
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
