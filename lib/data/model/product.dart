import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String seller;
  final String productName;
  final String productImageURL;
  final String productDescription;
  final num minBidPrice;
  final DateTime bidStartDate;

  Product({
    required this.id,
    required this.seller,
    required this.productName,
    required this.productImageURL,
    required this.productDescription,
    required this.minBidPrice,
    required this.bidStartDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'seller': seller,
      'productName': productName,
      'productImageURL': productImageURL,
      'productDescription': productDescription,
      'minBidPrice': minBidPrice,
      'bidStartDate': bidStartDate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    // print('inside fromMap');
    // print(data);
    String seller = data['seller'];
    String productName = data['productName'];
    String productImageURL = data['productImageURL'];
    String productDescription = data['productDescription'];
    num minBidPrice = data['minBidPrice'];
    DateTime bidStartDate = (data['bidStartDate'] as Timestamp).toDate();
    return Product(
      id: documentId,
      seller: seller,
      productName: productName,
      productImageURL: productImageURL,
      productDescription: productDescription,
      minBidPrice: minBidPrice,
      bidStartDate: bidStartDate,
    );
  }
  // factory Product.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  //   Map<String, dynamic>? data = doc.data();

  //   return Product(
  //     id: doc.id,
  //     seller: data?['seller'],
  //     productName: data?['productName'],
  //     productImageURL: data?['productImageURL'],
  //     productDescription: data?['productDescription'],
  //     minBidPrice: data?['minBidPrice'],
  //     bidStartDate: (data?['bidStartDate'] as Timestamp).toDate(),
  //   );
  // }

}
