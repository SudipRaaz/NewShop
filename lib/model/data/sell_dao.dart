import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/sell_data.dart';

class Sell_Dao {
  // final CollectionReference collection = FirebaseFirestore.instance
  //     .collection('Products')
  //     .doc('SubProductsCategory')
  //     .collection('MobileItems');
  // TODO: Add saveMessage
  void saveSellData(Sell_data selldata, String subCategory) {
    final CollectionReference collection = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection(subCategory);
    collection.add(selldata.toJson());
  }

  // TODO: Add getMessageStream
  Stream<QuerySnapshot> getProductStream(String subCategory) {
    final CollectionReference collection = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection(subCategory);

    return collection.snapshots();
  }
}
