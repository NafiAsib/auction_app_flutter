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
            Container(
              width: currentWidth,
              height: currentWidth,
              child: Image.network(
                '${product.productImageURL}',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Text('Product Name: '),
                Text('${product.productName}')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description: '),
                Text('${product.productDescription}'),
              ],
            ),
            Row(
              children: [
                Text('Minimum bid price: '),
                Text('${product.minBidPrice}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
