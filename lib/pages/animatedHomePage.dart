import 'package:authify_app/pages/homePage.dart';
import 'package:flutter/material.dart';

class AnimatedHomePage extends StatefulWidget {
  AnimatedHomePage({Key? key}) : super(key: key);

  @override
  _AnimatedHomePageState createState() {
    return _AnimatedHomePageState();
  }
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(microseconds: 800),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      animationController: _controller,
    );
  }
}
