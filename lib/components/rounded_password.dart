import 'package:flutter/material.dart';
import 'package:recipy/components/input_container.dart';
import 'package:recipy/constants/constants.dart';

class RoundedPassword extends StatelessWidget {
  const RoundedPassword({
    Key key,
    @required this.hint,
    @required this.controller,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        cursorColor: Colors.purpleAccent,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
