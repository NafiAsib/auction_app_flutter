import 'package:flutter/material.dart';

import 'package:auction_app/data/model/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    // var products = Provider.of<List<Product>>(context, listen: false);
    // return Center(child: Text('lenght is ${product.productName}'));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/product-details',
              arguments: product,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${product.productImageURL}',
                    // 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${product.productName}',
                    style: TextStyle(fontSize: 20),
                  ),
                  // Text(
                  //   '${product.productDescription}',
                  //   style: TextStyle(fontSize: 12),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bid starts at: ৳${product.minBidPrice}',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
