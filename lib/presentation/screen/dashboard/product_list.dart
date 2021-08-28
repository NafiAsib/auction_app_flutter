import 'package:auction_app/data/datasource/firestore_service.dart';
import 'package:auction_app/data/model/product.dart';
import 'package:auction_app/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firestoreDatabase =
        Provider.of<FirestoreDatabase>(context, listen: false);

    return StreamBuilder(
      stream: firestoreDatabase.productStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> products = snapshot.data as List<Product>;

          return ListView.builder(
            itemBuilder: (_, index) {
              return Container(
                child: ProductWidget(
                  product: products[index],
                ),
              );
            },
            itemCount: products.length,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print("error is => ${snapshot.error}");
          print(snapshot.error.hashCode);
          return Center(child: Text('Something went wrong!'));
        } else {
          return Text('No clue');
        }
      },
    );
  }
}
