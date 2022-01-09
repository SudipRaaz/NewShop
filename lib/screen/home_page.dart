import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/home_slideshow.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/components/tile_components.dart';
import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List imgs = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
  ];

  // List ProductsDocs = [];
  List topSelling = [];
  List recommendedItems = [];
  List featuredItems = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> stream1 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('PopularItems')
        .snapshots();
    ;
    final Stream<QuerySnapshot> stream2 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('RecommendedItems')
        .snapshots();
    ;
    final Stream<QuerySnapshot> stream3 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('MobileItems')
        .snapshots();
    ;

    return StreamBuilder3<QuerySnapshot, QuerySnapshot, QuerySnapshot>(
      streams: Tuple3(stream1, stream2, stream3),
      builder: (context, snapshots) {
        topSelling = [];
        recommendedItems = [];
        featuredItems = [];

        if (!snapshots.item1.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshots.item2.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshots.item3.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        snapshots.item1.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          topSelling.add(productdata);
          // a['id'] = document.id;
        }).toList();
        snapshots.item2.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          recommendedItems.add(productdata);
          // a['id'] = document.id;
        }).toList();
        snapshots.item3.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          featuredItems.add(productdata);
          // a['id'] = document.id;
        }).toList();

        return Scaffold(
            appBar: AppBar(
              title: const Text('Second Shop'),
              backgroundColor: Colors.orange.shade400,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      print("ProductsDocs: $topSelling");
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 40,
                    )),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
// ******************************************** carousel slider *********************************
                    const OfferSlider(),
// ******************************************** Items displaying *********************************
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            child: Text(
                              'Featured Items',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            height: 210,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      return ItemTiles(
                                        press: () {},
                                        title: featuredItems[index]['title'],
                                        description: featuredItems[index]
                                            ['description'],
                                        pcategory: featuredItems[index]
                                            ['category'],
                                        price: int.parse(
                                            featuredItems[index]['price']),
                                        downloadURL: featuredItems[index]
                                            ['downloadURL'],
                                        productID: featuredItems[index]
                                            ['productID'],
                                        sellerName: featuredItems[index]
                                            ['sellerName'],
                                        sellerPhone: featuredItems[index]
                                            ['sellerPhone'],
                                      );
                                    },
                                    separatorBuilder: (context, int index) {
                                      return const SizedBox(
                                        width: 8,
                                      );
                                    },
                                    itemCount: featuredItems.length)),
                          ),
                          const SizedBox(
                            child: Text(
                              'Top Selling',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            height: 210,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      return ItemTiles(
                                        press: () {},
                                        title: topSelling[index]['title'],
                                        description: topSelling[index]
                                            ['description'],
                                        pcategory: topSelling[index]
                                            ['category'],
                                        price: int.parse(
                                            topSelling[index]['price']),
                                        downloadURL: topSelling[index]
                                            ['downloadURL'],
                                        productID: topSelling[index]
                                            ['productID'],
                                        sellerName: topSelling[index]
                                            ['sellerName'],
                                        sellerPhone: topSelling[index]
                                            ['sellerPhone'],
                                      );
                                    },
                                    separatorBuilder: (context, int index) {
                                      return const SizedBox(
                                        width: 8,
                                      );
                                    },
                                    itemCount: topSelling.length)),
                          ),
                          const SizedBox(
                            child: Text(
                              'Recommended Items',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            height: 210,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, int index) {
                                      return ItemTiles(
                                        press: () {},
                                        title: recommendedItems[index]['title'],
                                        description: recommendedItems[index]
                                            ['description'],
                                        pcategory: recommendedItems[index]
                                            ['category'],
                                        price: int.parse(
                                            recommendedItems[index]['price']),
                                        downloadURL: topSelling[index]
                                            ['downloadURL'],
                                        productID: recommendedItems[index]
                                            ['productID'],
                                        sellerName: recommendedItems[index]
                                            ['sellerName'],
                                        sellerPhone: recommendedItems[index]
                                            ['sellerPhone'],
                                      );
                                    },
                                    separatorBuilder: (context, int index) {
                                      return const SizedBox(
                                        width: 8,
                                      );
                                    },
                                    itemCount: recommendedItems.length)),
                          ),

                          // const SizedBox(
                          //   child: Text(
                          //     'Sports Items',
                          //     style: TextStyle(fontSize: 25),
                          //   ),
                          // ),
                          // Container(
                          //   height: 210,
                          //   child: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: ListView.separated(
                          //           scrollDirection: Axis.horizontal,
                          //           itemBuilder: (context, int index) {
                          //             return ItemTiles(
                          //               index: index,
                          //               press: () {},
                          //               productsData: ProductsDocs,
                          //               title: ProductsDocs[index]['title'],
                          //               downloadURL: ProductsDocs[index]
                          //                   ['downloadURL'],
                          //               price: int.parse(
                          //                   ProductsDocs[index]['price']),
                          //             );
                          //           },
                          //           separatorBuilder: (context, int index) {
                          //             return const SizedBox(
                          //               width: 8,
                          //             );
                          //           },
                          //           itemCount: ProductsDocs.length)),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ));
        //             });
        //       },
        //     );
      },
    );
  }
}
