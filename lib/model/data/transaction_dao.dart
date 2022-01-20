import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/transaction.dart';

class Transaction_Dao {
  //firebase collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('TransactionDetails');

  // TODO: Add saveTransaction data
  void saveTransactionData(Transaction_Data transactionData) {
    collection.add(transactionData.toJson());
  }
}
