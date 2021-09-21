import 'package:auction_app/presentation/screen/product_details/product_details_provider.dart';
import 'package:flutter/material.dart';

import 'package:auction_app/data/model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                final provider =
                    Provider.of<ProductDetailsProvider>(context, listen: false);
                // print(int.parse(priceController.text));
                // print(maxBidPrice);
                if (int.parse(priceController.text) <= provider.maxBidPrice!) {
                  // print("here inside checking");
                  Fluttertoast.showToast(
                    msg: "Enter price higher than current bid price",
                    fontSize: 18,
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: "You are now the highest bidder",
                    fontSize: 18,
                    toastLength: Toast.LENGTH_LONG,
                  );
                  provider.bid(
                      int.parse(priceController.text), widget.product.id);
                  Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  num? maxBidPrice;
  @override
  void initState() {
    super.initState();
    final provider =
        Provider.of<ProductDetailsProvider>(context, listen: false);
    provider.productID = widget.product.id;
    // print("initState called");

    provider.getBid();
    // maxBidPrice = provider.maxBidPrice;
    // this.getData();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    final provider =
        Provider.of<ProductDetailsProvider>(context, listen: false);
    final currentWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.product.productName}'),
      ),
      floatingActionButton: widget.product.seller == firebaseUser?.uid
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
                    '${widget.product.productImageURL}',
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
                    '${widget.product.productName}',
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
                    '${widget.product.productDescription}',
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
                  Text('Current bid price: '),
                  // Text(
                  //   '৳',
                  //   style: TextStyle(fontSize: 25),
                  // ),
                  Text(
                    provider.maxBidPrice == null
                        ? 'No bid yet!'
                        : '৳${provider.maxBidPrice}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              firebaseUser?.uid == provider.bidder
                  ? Text("You are the highest bidder")
                  : Container(),
              SizedBox(
                height: 20,
              ),
              widget.product.seller == firebaseUser?.uid
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
