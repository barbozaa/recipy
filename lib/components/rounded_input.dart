import 'package:flutter/material.dart';
import 'package:recipy/components/input_container.dart';
import 'package:recipy/constants/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key key,
    @required this.hint,
    @required this.icon,
    @required this.controller,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
