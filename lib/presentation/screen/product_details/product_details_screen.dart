import 'package:flutter/material.dart';

import 'package:auction_app/data/model/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('${product.productName}'),
      ),
      body: Container(
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
            )
          ],
        ),
      ),
    );
  }
}
