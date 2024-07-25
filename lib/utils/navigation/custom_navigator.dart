import 'package:flutter/material.dart';

class CustomNavigator {
  static void navigateTo(BuildContext context, Widget nextPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
        settings: RouteSettings(name: nextPage.runtimeType.toString()),
      ),
    );
  }

  static void navigateOfAll(BuildContext context, Widget nextPage) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
      (route) => true, // Remove all routes from the stack
    );
  }

  static void navigateWithTransition(
      BuildContext context, Widget nextPage, RouteTransition transition) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (transition) {
            case RouteTransition.fade:
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            case RouteTransition.slide:
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            // Add more transitions as needed
            default:
              return child;
          }
        },
        settings: RouteSettings(name: nextPage.runtimeType.toString()),
      ),
    );
  }
}

enum RouteTransition {
  fade,
  slide,
  // Add more transition types as needed
}
