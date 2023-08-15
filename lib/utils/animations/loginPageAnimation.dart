import 'package:flutter/animation.dart';


// Used Animation Class

class LoginPageAnimation {
  AnimationController controller;
  late Animation<double> circleSize;

  LoginPageAnimation(this.controller) {
    // Define the style of your animation
    circleSize = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
  }
}
