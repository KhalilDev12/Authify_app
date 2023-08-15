import 'package:authify_app/pages/animatedHomePage.dart';
import 'package:authify_app/utils/animations/loginPageAnimation.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import '../utils/page_routes/fadePageRoute.dart';

class LoginPage extends StatelessWidget {
  late AnimationController animationController;
  late LoginPageAnimation _animation;

  LoginPage({required this.animationController}) {
    _animation = LoginPageAnimation(animationController);
    animationController.forward();
  }

  late double _deviceHeight, _deviceWidth;
  final Color _primaryColor = const Color.fromRGBO(125, 191, 211, 1);
  final Color _secondaryColor = const Color.fromRGBO(169, 224, 241, 1);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _primaryColor,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _avatarWidget(),
                Column(
                  children: [
                    _emailTextField(),
                    _passwordTextField(),
                  ],
                ),
                _loginButton(context),
              ],
            ),
          ),
        ));
  }

  Widget _avatarWidget() {
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
              _animation.circleSize.value, _animation.circleSize.value, 1),
          child: Container(
            width: _deviceHeight * 0.25,
            height: _deviceHeight * 0.25,
            decoration: BoxDecoration(
              color: _secondaryColor,
              borderRadius: BorderRadius.circular(500),
              image: const DecorationImage(
                image: AssetImage('assets/images/main_avatar.png'),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return SizedBox(
      width: _deviceWidth * 0.70,
      child: const TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Titikhalil@gmail.com',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return SizedBox(
      width: _deviceWidth * 0.70,
      child: const TextField(
        obscureText: true,
        obscuringCharacter: "*",
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Colors.white)),
      onPressed: () {
        animationController.reverse().then(
              (value) => Navigator.pushReplacement(
                context,
                FadePageRoute(AnimatedHomePage()),
              ),
            );
      },
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      child: Text("LOG IN",
          style: TextStyle(
              fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold)),
    );
  }
}
