import 'package:flutter/material.dart';
import 'package:second_shopp/components/category_tiles.dart';
import 'package:second_shopp/model/images.dart';
import 'package:second_shopp/screen/category_items.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  final List<String> entries = [
    'Fashion',
    'Electronics',
    'fashion & Accessories',
    'Home & Garden',
    'Baby and toddler',
    'Jewellery & Watches',
    'Health & Beauty',
    'Sports & Leisure',
    'Toys and Games',
    'Vehicles',
    'Service'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade400,
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: GestureDetector(
                onTap: () {
                  String categoryName = entries[index].toString();
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => Categorylist(
                                categoryName: categoryName,
                              )));
                },
                child: ListTile(
                  title: Text(
                    entries[index],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
