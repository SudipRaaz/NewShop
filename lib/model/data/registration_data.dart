import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration {
  final String name;
  final String address;
  final int phone;
  final String email;
  final String password;

  DocumentReference? reference;

  Registration(
      {required this.name,
      required this.address,
      required this.phone,
      required this.email,
      required this.password,
      this.reference});
  // convert from json
  factory Registration.fromJson(Map<dynamic, dynamic> json) => Registration(
      name: json['Name'] as String,
      address: json['Address'] as String,
      phone: int.parse(json['Phone'] as String),
      email: json['Email'] as String,
      password: json['password'] as String);
  // convert to json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'Name': name,
        'Address': address,
        'Phone': phone.toString(),
        'email': email,
        'password': password
      };

  // TODO: Add snapshot
  factory Registration.fromSnapshot(DocumentSnapshot snapshot) {
    final registration =
        Registration.fromJson(snapshot.data() as Map<String, dynamic>);
    registration.reference = snapshot.reference;
    return registration;
  }
}
