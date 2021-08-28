import 'package:auction_app/data/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  Stream<List<Product>> productStream() {
    final Stream<QuerySnapshot> snapshots =
        FirebaseFirestore.instance.collection('product-info').snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs.map((snapshot) {
        // print('going fromMap');
        var dbg = Product.fromMap(
            snapshot.data() as Map<String, dynamic>, snapshot.id);
        // print(dbg.productName);
        return dbg;
      }).toList();

      // print('inside firestoredatabase');
      // print(result);
      return result;
    });
  }

  Stream<List<Product>> productofUserStream(String? uid) {
    final Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
        .collection('product-info')
        .where('seller', isEqualTo: uid)
        .snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs.map((snapshot) {
        // print('going fromMap');
        var dbg = Product.fromMap(
            snapshot.data() as Map<String, dynamic>, snapshot.id);
        // print(dbg.productName);
        return dbg;
      }).toList();

      // print('inside firestoredatabase');
      // print(result);
      return result;
    });
  }
}
