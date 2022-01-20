import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportMessage {
  final String userID;
  final String sellerID;
  final String message;
  final String productID;

  DocumentReference? reference;

  ReportMessage({
    required this.userID,
    required this.sellerID,
    required this.message,
    required this.productID,
  });
// convert to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ReporterID': userID,
        'sellerID': sellerID,
        'Message': message,
        'ProductID': productID,
      };
}
