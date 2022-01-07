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
        title: Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  String categoryName = entries[index].toString();
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => Categorylist(
                                categoryName: categoryName,
                              )));
                  print('pressed on : $categoryName');
                  print('hello text tapped');
                },
                child: Text('${entries[index]}')),
          );
        },
      ),
    );
  }
}
