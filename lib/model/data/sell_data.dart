import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sell_data {
  final String productID;
  final String title;
  final String description;
  final String category;
  final int price;
  final String downloadURL;
  final String UserID;
  final String sellerName;
  final String sellerPhone;

  DocumentReference? reference;

  Sell_data(
      {required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.productID,
      required this.downloadURL,
      required this.UserID,
      required this.sellerName,
      required this.sellerPhone,
      this.reference});

// todo: Add json converters
  factory Sell_data.fromJson(Map<dynamic, dynamic> json) => Sell_data(
        productID: json['productID'] as String,
        title: json['title'] as String,
        description: (json['description'] as String),
        category: json['category'] as String,
        price: int.parse(json['price'] as String),
        downloadURL: (json['downloadURL'] as String),
        UserID: (json['UserID'] as String),
        sellerName: (json['sellerName'] as String),
        sellerPhone: (json['sellerPhone'] as String),
      );
  // concert to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'productID': productID,
        'title': title,
        'description': description,
        'category': category,
        'price': price.toString(),
        'downloadURL': downloadURL,
        'UserID': UserID,
        'sellerName': sellerName,
        'sellerPhone': sellerPhone,
      };

  // TODO: Add snapshot
  factory Sell_data.fromSnapshot(DocumentSnapshot snapshot) {
    final sell_data =
        Sell_data.fromJson(snapshot.data() as Map<String, dynamic>);
    sell_data.reference = snapshot.reference;
    return sell_data;
  }
}
