import 'package:auction_app/data/model/product.dart';
import 'package:auction_app/data/model/user.dart';
import 'package:auction_app/presentation/screen/add_product/add_product_screen.dart';
import 'package:auction_app/presentation/screen/dashboard/dashboard_screen.dart';
import 'package:auction_app/presentation/screen/home/home_screen.dart';
import 'package:auction_app/presentation/screen/product_details/product_details_screen.dart';
import 'package:auction_app/presentation/screen/signup/signup_screen.dart';
import 'package:auction_app/presentation/screen/user_posted_items/my_posted_items_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case '/add-product':
        return MaterialPageRoute(builder: (_) => AddProduct());
      case '/product-details':
        return MaterialPageRoute(
            builder: (_) => ProductDetails(product: args as Product));
      case '/my-items':
        return MaterialPageRoute(
            builder: (_) => MyPostedItems(user: args as UserModel));
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
