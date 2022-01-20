import 'package:flutter/material.dart';
import 'package:second_shopp/screen/category_items.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

// categories available in the application
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
      // using listview builder
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          // returning a decorated container with shadow
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
              // open the sub page for displaying the items
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
