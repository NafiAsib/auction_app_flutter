import 'package:auction_app/presentation/screen/dashboard/product_list.dart';
import 'package:auction_app/presentation/widgets/product_widget.dart';
import 'package:auction_app/presentation/widgets/navigation_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Auction'),
      ),
      body: SafeArea(
        child: Container(
          child: ProductList(),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-product');
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
