import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/components/category_tiles.dart';
import 'package:second_shopp/model/images.dart';

class Categorylist extends StatelessWidget {
  Categorylist({Key? key}) : super(key: key);

  final List ProductsDocs = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> ProductStream = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('PopularItems')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: ProductStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map productdata = document.data() as Map<String, dynamic>;
            ProductsDocs.add(productdata);
            // a['id'] = document.id;
          }).toList();

          return Scaffold(
              appBar: AppBar(title: Text("Categories")),
              body: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: ProductsDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return categoryTiles(
                      title: ProductsDocs[index]['title'],
                      price: int.parse(ProductsDocs[index]['price']),
                      pcategory: ProductsDocs[index]['category'],
                      downloadURL: ProductsDocs[index]['downloadURL'],
                      description: ProductsDocs[index]['description'],
                      sellerName: ProductsDocs[index]['sellerName'],
                      sellerPhone: ProductsDocs[index]['sellerPhone'],
                      productID: ProductsDocs[index]['productID'],
                    );
                  }));
        });
  }
}
