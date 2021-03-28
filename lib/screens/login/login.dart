import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipy/components/cancel_button.dart';
import 'package:recipy/components/login_form.dart';
import 'package:recipy/components/register_form.dart';
import 'package:recipy/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  Animation<double> containerSize;
  AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInsets = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    final username = TextEditingController();
    final password = TextEditingController();
    final name = TextEditingController();

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));

    return Scaffold(
      body: Stack(
        children: [
          //decorations
          Positioned(
            top: 100,
            right: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kPrimaryColor,
              ),
            ),
          ),

          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kPrimaryColor,
              ),
            ),
          ),

          //Cancel Button
          CancelButton(
            isLogin: isLogin,
            animationController: animationController,
            animationDuration: animationDuration,
            size: size,
            tapEvent: isLogin
                ? null
                : () {
                    animationController.reverse();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
          ),

          //Login container
          LoginForm(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            defaultRegisterSize: defaultLoginSize,
            username: username,
            password: password,
          ),

          // Register Container
          AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              if (viewInsets == 0) {
                return buildRegisterContainer();
              }
              return Container();
            },
          ),
          RegisterForm(
            isLogin: isLogin,
            animationDuration: animationDuration,
            size: size,
            defaultRegisterSize: defaultRegisterSize,
            username: username,
            name: name,
            password: password,
          ),
        ],
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: kBackgroundColor),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  animationController.forward();
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
