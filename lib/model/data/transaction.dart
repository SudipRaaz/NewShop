import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Transaction_Data {
  final double amount;
  final String mobile;
  final String product_ID;
  final String product_name;
  final String token;

  DocumentReference? reference;

  Transaction_Data(
      {required this.amount,
      required this.mobile,
      required this.product_ID,
      required this.product_name,
      required this.token,
      this.reference});

// todo: Add json converters
  factory Transaction_Data.fromJson(Map<dynamic, dynamic> json) =>
      Transaction_Data(
        amount: json['amount'] as double,
        mobile: json['mobile'] as String,
        product_ID: (json['product_ID'] as String),
        product_name: json['product_name'] as String,
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'mobile': mobile,
        'product_ID': product_ID,
        'product_name': product_name,
        'token': token
      };

  // TODO: Add snapshot
  factory Transaction_Data.fromSnapshot(DocumentSnapshot snapshot) {
    final transaction_data =
        Transaction_Data.fromJson(snapshot.data() as Map<String, dynamic>);
    transaction_data.reference = snapshot.reference;
    return transaction_data;
  }
}
