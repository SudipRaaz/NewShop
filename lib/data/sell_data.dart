import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Sell_data {
  final String title;
  final String description;
  final String category;
  final int price;

  DocumentReference? reference;

  Sell_data(
      {required this.title,
      required this.description,
      required this.category,
      required this.price,
      this.reference});
// todo: Add json converters
  factory Sell_data.fromJson(Map<dynamic, dynamic> json) => Sell_data(
      title: json['title'] as String,
      description: (json['description'] as String),
      category: json['category'] as String,
      price: int.parse(json['price'] as String));

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'category': category,
        'price': price.toString(),
      };

  // TODO: Add snapshot
  factory Sell_data.fromSnapshot(DocumentSnapshot snapshot) {
    final sell_data =
        Sell_data.fromJson(snapshot.data() as Map<String, dynamic>);
    sell_data.reference = snapshot.reference;
    return sell_data;
  }
}
