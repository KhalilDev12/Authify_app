import 'package:authify_app/pages/animatedLoginPage.dart';
import 'package:authify_app/utils/animations/loginPageAnimation.dart';
import 'package:authify_app/utils/page_routes/fadePageRoute.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late AnimationController animationController;
  late LoginPageAnimation _animation;

  HomePage({required this.animationController}) {
    _animation = LoginPageAnimation(animationController);
    animationController.forward();
  }

  late double _deviceHeight, _deviceWidth;
  final Color _primaryColor = const Color.fromRGBO(125, 191, 211, 1);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: _deviceHeight * 0.75,
              width: _deviceWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: _deviceHeight * 0.015),
                      _avatarWidget(),
                      SizedBox(height: _deviceHeight * 0.01),
                      _nameWidget(),
                    ],
                  ),
                  _logoutButton(context)
                ],
              ),
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
              color: _primaryColor,
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

  Widget _nameWidget() {
    return Text('Khalil TITI',
        style: TextStyle(
            color: _primaryColor, fontSize: 30, fontWeight: FontWeight.w400));
  }

  Widget _logoutButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.016),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: _primaryColor, width: 2)),
        onPressed: () {
          animationController.reverse().then(
                (value) => Navigator.pushReplacement(
                  context,
                  FadePageRoute(AnimatedLoginPage()),
                ),
              );
        },
        minWidth: _deviceWidth * 0.38,
        height: _deviceHeight * 0.055,
        color: Colors.white,
        child: Text("LOG OUT",
            style: TextStyle(
                fontSize: 16,
                color: _primaryColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
