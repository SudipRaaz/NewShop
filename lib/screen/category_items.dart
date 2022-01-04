import 'package:flutter/material.dart';
import 'package:second_shopp/components/category_tiles.dart';
import 'package:second_shopp/model/images.dart';

class Categorylist extends StatelessWidget {
  Categorylist({Key? key}) : super(key: key);

  List imgs = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Categories")),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 300,
            itemBuilder: (BuildContext context, int index) {
              return categoryTiles(index: index)
                  // Card(
                  //   color: Colors.amber,
                  //   child: Center(child: Text('$index')),
                  // )
                  ;
            }));
  }
}
