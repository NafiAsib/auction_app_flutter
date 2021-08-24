import 'package:auction_app/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:auction_app/presentation/screen/home/home_screen.dart';
import 'package:auction_app/presentation/screen/login/login_screen.dart';
import 'package:auction_app/presentation/screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // static const INITIAL_ROUTE = '/';
  // static const LOGIN = '/login';
  // static const REGISTER = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
