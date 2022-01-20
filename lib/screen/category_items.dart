import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/components/category_tiles.dart';

class Categorylist extends StatelessWidget {
  Categorylist({Key? key, required this.categoryName}) : super(key: key);
  String categoryName;

  List ProductsDocs = [];

  @override
  Widget build(BuildContext context) {
    // creating the instace of the firebase collection dynamically based on the tapped category tile
    final Stream<QuerySnapshot> ProductStream = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection(categoryName)
        .snapshots();

    // stream builder from firebase
    return StreamBuilder<QuerySnapshot>(
        stream: ProductStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          //data not received
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //connection state waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //clearing the productsDocs list
          ProductsDocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map productdata = document.data() as Map<String, dynamic>;
            ProductsDocs.add(productdata);
          }).toList();

          return Scaffold(
              appBar: AppBar(
                  title: Text(categoryName),
                  backgroundColor: Colors.orange.shade400),
              // displaying product tiles in gridview
              body: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: ProductsDocs.length,
                  itemBuilder: (BuildContext context, int index) {
                    // passing each data of each product for the product tile
                    return categoryTiles(
                      title: ProductsDocs[index]['title'],
                      price: int.parse(ProductsDocs[index]['price']),
                      pcategory: ProductsDocs[index]['category'],
                      downloadURL: ProductsDocs[index]['downloadURL'],
                      description: ProductsDocs[index]['description'],
                      sellerID: ProductsDocs[index]['UserID'],
                      sellerName: ProductsDocs[index]['sellerName'],
                      sellerPhone: ProductsDocs[index]['sellerPhone'],
                      productID: ProductsDocs[index]['productID'],
                    );
                  }));
        });
  }
}
