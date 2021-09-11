import 'package:flutter/material.dart';

import 'package:auction_app/data/model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  createAlertDialog(BuildContext context) {
    final priceController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter your bidding price"),
          content: TextField(
            controller: priceController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    final currentWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('${product.productName}'),
      ),
      floatingActionButton: product.seller == firebaseUser?.uid
          ? Container()
          : Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      createAlertDialog(context);
                      // Navigator.pushNamed(context, '/add-product');
                    },
                    child: Text(
                      'Bid',
                      style: TextStyle(
                        color: Colors.indigo[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: currentWidth,
                  height: currentWidth,
                  child: Image.network(
                    '${product.productImageURL}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text('Product Name: '),
                  Text(
                    '${product.productName}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: '),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${product.productDescription}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Minimum bid price: '),
                  Text(
                    '৳',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '${product.minBidPrice}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              product.seller == firebaseUser?.uid
                  ? Container()
                  : Row(
                      children: [
                        Text('My bid price: '),
                        Text(
                          '',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          // '${product.minBidPrice}',
                          'You haven\'t placed a bid on this item',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
