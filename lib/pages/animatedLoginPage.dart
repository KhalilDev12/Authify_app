import 'package:authify_app/pages/loginPage.dart';
import 'package:flutter/material.dart';

class AnimatedLoginPage extends StatefulWidget {
  AnimatedLoginPage({Key? key}) : super(key: key);

  @override
  _AnimatedLoginPageState createState() {
    return _AnimatedLoginPageState();
  }
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(milliseconds: 400), // set the Duration of your animation
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(animationController: _controller,); // pass the controller to Login Page
  }
}
