import 'package:flutter/cupertino.dart';

class FadePageRoute extends PageRouteBuilder {
  Widget _child;

  FadePageRoute(this._child)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return _child;
          },
        );
}
