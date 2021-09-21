import 'dart:io';

import 'package:auction_app/core/utils/notifier_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddProductProvider extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.INITIAL;
  NotifierState get notifierState => _notifierState;

  DateTime? bidStartDate;
  File? image;
  String? name;
  String? desc;
  String? url;
  num? minBidPrice;

  Future<void> upload() async {
    final user = FirebaseAuth.instance.currentUser;
    _setState(NotifierState.LOADING);
    String imageName = randomAlphaNumeric(9);
    // print("imageName is: $imageName");
    await uploadImage(image, imageName);
    await downloadURLExample(imageName);
    CollectionReference products =
        FirebaseFirestore.instance.collection('product-info');

    CollectionReference bids = FirebaseFirestore.instance.collection('bids');

    return products.add({
      "seller": user?.uid,
      "productName": name,
      "productImageURL": url,
      "productDescription": desc,
      "minBidPrice": minBidPrice,
      "bidStartDate": bidStartDate,
    }).then((value) async {
      // print("User Added");
      await bids.add({
        "productID": value.id,
      }).catchError((e) {
        print("Failed to add bid reference");
      });
      _setState(NotifierState.LOADED);
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }

  Future<void> uploadImage(File? image, String imageName) async {
    firebase_storage.UploadTask task = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("productImages")
        .child("$imageName.jpg")
        .putFile(image!);

    task.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
      if (snapshot.state == TaskState.success) {
        // _setState(NotifierState.LOADED);
      } else if (snapshot.state == TaskState.running) {
        _setState(NotifierState.LOADING);
      }
    }, onError: (e) {
      // print(task.snapshot);

      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    });

    try {
      await task;
      // print('Upload complete.');
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print('User does not have permission to upload to this reference.');
      }
    }
  }

  Future<void> downloadURLExample(String imageName) async {
    url = await firebase_storage.FirebaseStorage.instance
        .ref('productImages/$imageName.jpg')
        .getDownloadURL();
    // print("url is: $url");
  }

  void _setState(NotifierState notifierState) {
    _notifierState = notifierState;
    notifyListeners();
  }

  void setInitail() {
    _setState(NotifierState.INITIAL);
    print(_notifierState);
  }

  void setimage(File? img) {
    image = img;
    notifyListeners();
  }

  void setDate(DateTime date) {
    bidStartDate = date;
    notifyListeners();
  }
}
