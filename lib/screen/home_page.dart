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
  List mobilesItems = [];

  // void popularItems() {
  //   FirebaseFirestore.instance
  //       .collection('Products')
  //       .doc('SubProductsCategory')
  //       .collection('RecommendedItems')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.map((DocumentSnapshot document) {
  //       Map productdata = document.data() as Map<String, dynamic>;
  //       recommendedItems.add(productdata);
  //       // a['id'] = document.id;
  //     }).toList();

  //     print("recommended snapshot : ${recommendedItems}");
  //   });
  // }

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
        mobilesItems = [];

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
          mobilesItems.add(productdata);
          // a['id'] = document.id;
        }).toList();
        // return StreamBuilder<QuerySnapshot>(
        //   stream: stream1,
        //   builder: (context, snapshot1) {
        //     return StreamBuilder<QuerySnapshot>(
        //       stream: stream2,
        //       builder: (context, snapshot2) {
        //         return StreamBuilder<QuerySnapshot>(
        //             stream: stream3,
        //             builder: (context, snapshot3) {
        //               return Text(
        //                 'stream1: ${snapshot1.data} - stream2: ${snapshot2.data} - stream3: ${snapshot3.data}',
        //               );

        // StreamBuilder<QuerySnapshot>(
        //     stream: ProductStream,
        //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //       if (snapshot.hasError) {
        //         print('Something went Wrong');
        //       }
        //       if (!snapshot.hasData) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       ProductsDocs = [];

        //       snapshot.data!.docs.map((DocumentSnapshot document) {
        //         Map productdata = document.data() as Map<String, dynamic>;
        //         ProductsDocs.add(productdata);
        //         // a['id'] = document.id;
        //       }).toList();

        return Scaffold(
            appBar: AppBar(
              title: const Text('Second Shop'),
              backgroundColor: Colors.orange.shade400,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      print("ProductsDocs: $topSelling");
                      // print(snapshots.item1.data);
                      // print(snapshots.item2.data);
                      // print(snapshots.item3.data);
                      {}

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CartItems()));
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
// **************************************** search item bar ****************************************
                    Container(
                      color: Colors.orange.shade400,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  // flex: 1,
                                  child: TextFormField(
                                      decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Items",
                                hintStyle: TextStyle(color: Colors.white),
                              ))),
                              Expanded(
                                  flex: 0,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.search)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.mic))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
// *************************************************Chips ****************************************
                    // chips elements
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Chip(
                          label: Text("Category"),
                          elevation: 4,
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Chip(
                          label: Text("Auction"),
                          elevation: 4,
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Chip(
                          label: Text("Rent"),
                          elevation: 4,
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Chip(
                          label: Text("Offers"),
                          elevation: 4,
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
// ******************************************** carousel slider *********************************
                    OfferSlider(),
// ******************************************** Items displaying *********************************
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const SizedBox(
                            child: Text(
                              'Mobiles Items',
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
                                        title: mobilesItems[index]['title'],
                                        description: mobilesItems[index]
                                            ['description'],
                                        pcategory: mobilesItems[index]
                                            ['category'],
                                        price: int.parse(
                                            mobilesItems[index]['price']),
                                        downloadURL: mobilesItems[index]
                                            ['downloadURL'],
                                        productID: mobilesItems[index]
                                            ['productID'],
                                        sellerName: mobilesItems[index]
                                            ['sellerName'],
                                        sellerPhone: mobilesItems[index]
                                            ['sellerPhone'],
                                      );
                                    },
                                    separatorBuilder: (context, int index) {
                                      return const SizedBox(
                                        width: 8,
                                      );
                                    },
                                    itemCount: mobilesItems.length)),
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
