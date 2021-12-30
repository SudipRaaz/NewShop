import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/sell_data.dart';

class Sell_Dao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('userdata');
  // TODO: Add saveMessage
  void saveSellData(Sell_data selldata) {
    collection.add(selldata.toJson());
  }

  // TODO: Add getMessageStream
  Stream<QuerySnapshot> getMessageStream() {
    return collection.snapshots();
  }
}
