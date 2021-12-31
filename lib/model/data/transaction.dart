import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Transaction_Data {
  final String productID;
  final String title;
  final String description;
  final String category;
  final int price;

  DocumentReference? reference;

  Transaction_Data(
      {required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.productID,
      this.reference});

// todo: Add json converters
  factory Transaction_Data.fromJson(Map<dynamic, dynamic> json) =>
      Transaction_Data(
          productID: json['productID'] as String,
          title: json['title'] as String,
          description: (json['description'] as String),
          category: json['category'] as String,
          price: int.parse(json['price'] as String));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'productID': productID,
        'title': title,
        'description': description,
        'category': category,
        'price': price.toString(),
      };

  // TODO: Add snapshot
  factory Transaction_Data.fromSnapshot(DocumentSnapshot snapshot) {
    final transaction_data =
        Transaction_Data.fromJson(snapshot.data() as Map<String, dynamic>);
    transaction_data.reference = snapshot.reference;
    return transaction_data;
  }
}
