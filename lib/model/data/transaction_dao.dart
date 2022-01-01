import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/transaction.dart';

class Transaction_Dao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('TransactionDetails');

  // TODO: Add saveMessage
  void saveTransactionData(Transaction_Data transactionData) {
    collection.add(transactionData.toJson());
  }
}
