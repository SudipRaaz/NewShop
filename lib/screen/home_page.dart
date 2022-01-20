import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/components/home_slideshow.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/components/tile_components.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

// lists to store data from multiple streams
  List popularItems = [];
  List recommendedItems = [];
  List featuredItems = [];

  @override
  Widget build(BuildContext context) {
    //stream1 from popular items
    final Stream<QuerySnapshot> stream1 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('PopularItems')
        .snapshots();
    //stream2 from recommended items
    final Stream<QuerySnapshot> stream2 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('RecommendedItems')
        .snapshots();
    //stream3 from Featured items
    final Stream<QuerySnapshot> stream3 = FirebaseFirestore.instance
        .collection('Products')
        .doc('SubProductsCategory')
        .collection('FeaturedItem')
        .snapshots();
    //managing tuple stream data into list
    return StreamBuilder3<QuerySnapshot, QuerySnapshot, QuerySnapshot>(
      streams: Tuple3(stream1, stream2, stream3),
      builder: (context, snapshots) {
        popularItems = [];
        recommendedItems = [];
        featuredItems = [];
        //circular progress indicator
        if (!snapshots.item1.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //circular progress indicator
        if (!snapshots.item2.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //circular progress indicator
        if (!snapshots.item3.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // converting JSON to list
        snapshots.item1.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          popularItems.add(productdata);
        }).toList();

        // converting JSON to list
        snapshots.item2.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          recommendedItems.add(productdata);
        }).toList();

        // converting JSON to list
        snapshots.item3.data!.docs.map((DocumentSnapshot document) {
          Map productdata = document.data() as Map<String, dynamic>;
          featuredItems.add(productdata);
        }).toList();

        return Scaffold(
            appBar: AppBar(
              title: const Text('Second Shop'),
              backgroundColor: Colors.orange.shade400,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartItems()));
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
                          // ******************************************** Featured Items *********************************
                          const SizedBox(
                            child: Text(
                              'Featured Items',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          SizedBox(
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
                                        sellerID: featuredItems[index]
                                            ['UserID'],
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
                          // ******************************************** Popular Items *********************************
                          const SizedBox(
                            child: Text(
                              'Popular Items',
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
                                        title: popularItems[index]['title'],
                                        description: popularItems[index]
                                            ['description'],
                                        pcategory: popularItems[index]
                                            ['category'],
                                        price: int.parse(
                                            popularItems[index]['price']),
                                        downloadURL: popularItems[index]
                                            ['downloadURL'],
                                        productID: popularItems[index]
                                            ['productID'],
                                        sellerID: popularItems[index]['UserID'],
                                        sellerName: popularItems[index]
                                            ['sellerName'],
                                        sellerPhone: popularItems[index]
                                            ['sellerPhone'],
                                      );
                                    },
                                    separatorBuilder: (context, int index) {
                                      return const SizedBox(
                                        width: 8,
                                      );
                                    },
                                    itemCount: popularItems.length)),
                          ),
                          // ******************************************** recommended Items *********************************
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
                                        downloadURL: recommendedItems[index]
                                            ['downloadURL'],
                                        productID: recommendedItems[index]
                                            ['productID'],
                                        sellerID: recommendedItems[index]
                                            ['UserID'],
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
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }
}
