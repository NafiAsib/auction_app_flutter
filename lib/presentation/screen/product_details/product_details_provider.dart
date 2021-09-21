import 'package:auction_app/core/utils/notifier_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.INITIAL;
  NotifierState get notifierState => _notifierState;

  num? bidPrice;

  bool isUserMaxBidder = true;
  num? maxBid;
  String id = "";
  String productID = "";
  String bidder = "";
  num? maxBidPrice;

  Future<void> bid(num price, String productID) async {
    final user = FirebaseAuth.instance.currentUser;
    bidPrice = price;
    await FirebaseFirestore.instance
        .collection('bids')
        .where('productID', isEqualTo: productID)
        .get()
        .then(
            (snapshot) => snapshot.docs.forEach((element) => id = element.id));

    DocumentReference db =
        FirebaseFirestore.instance.collection('bids').doc(id);

    return db
        .update({
          "price": bidPrice,
          "bidder": user?.uid,
        })
        .then((res) => print("updated"))
        .catchError((e) => print(e));

    //print(id);

    // return db
    //     .update({
    //       "bids": [
    //         {"bidder": user?.uid, "price": bidPrice}
    //       ]
    //     })
    //     .then((value) => print("Updated"))
    //     .catchError((e) => print(e));

    // return db.update({
    //   "bids": {
    //     "bidder": FieldValue.arrayRemove([user?.uid])
    //   }
    // }).then((value) async {
    //   print("deleted");
    //   // print(user?.uid);
    //   await db.update({
    //     "price": bidPrice,
    //     "bidder": user?.uid,
    //     // "bids": FieldValue.arrayUnion([
    //     //   {"bidder": user?.uid, "price": bidPrice}
    //     // ])
    //   }).then((value) => print('added'));
    // }).catchError((e) => print(e));

    //   return biddingProduct.add({
    //     "seller": user?.uid,
    //     "productName": name,
    //     "productImageURL": url,
    //     "productDescription": desc,
    //     "minBidPrice": minBidPrice,
    //     "bidStartDate": bidStartDate,
    //   }).then((value) {
    //     // print("User Added");
    //     _setState(NotifierState.LOADED);
    //   }).catchError((error) {
    //     print("Failed to add user: $error");
    //   });
    // }
  }

  Future<void> getBid() async {
    // DocumentReference db =
    //     FirebaseFirestore.instance.collection('bids').doc(id);
    await load();
    final user = FirebaseAuth.instance.currentUser;
    print("here");
    // print(id);
    var bid;
    await FirebaseFirestore.instance
        .collection('bids')
        .doc(id)
        .get()
        .then((value) {
      bidder = value.data()?['bidder'];
      maxBidPrice = value.data()?['price'];
      print("printing maxBidPrice");
      print(maxBidPrice);
    });

    // print(bid);
    if (bidder == user?.uid) {
      isUserMaxBidder = true;
    } else {
      isUserMaxBidder = false;
    }
  }

  Future<void> load() async {
    print("in load");
    await FirebaseFirestore.instance
        .collection('bids')
        .where('productID', isEqualTo: productID)
        .get()
        .then(
            (snapshot) => snapshot.docs.forEach((element) => id = element.id));
  }

  void _setState(NotifierState notifierState) {
    _notifierState = notifierState;
    notifyListeners();
  }
}
