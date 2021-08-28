import 'package:auction_app/data/datasource/firestore_service.dart';
import 'package:auction_app/data/model/product.dart';
import 'package:auction_app/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);
  // final db = FetchProducts();

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

  // final String documentId;

  // GetUserName(this.documentId);

  // final Stream<QuerySnapshot> _productsStream =
  //     FirebaseFirestore.instance.collection('product-info').snapshots();

  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: _productsStream,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text('Something went wrong!');
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: CircularProgressIndicator());
  //       }

  //       return ListView(
  //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
  //           Map<String, dynamic> data =
  //               document.data()! as Map<String, dynamic>;
  //           return ListTile(

  //           );
  //         }).toList(),
  //       );
  //     },
  //   );
  // }
}


// return Container(
//       child: ListView.builder(
//         itemBuilder: (_, index) {
//           return Container(
//             child: ProductWidget(),
//           );
//         },
//         itemCount: 10,
//       ),
//     )