import 'package:auction_app/presentation/screen/dashboard/product_widget.dart';
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
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Container(
                child: ProductWidget(),
              );
            },
            itemCount: 10,
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
