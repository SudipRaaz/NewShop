import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_shopp/components/home_slideshow.dart';
import 'package:second_shopp/components/tile_components.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Shop'),
          backgroundColor: Colors.orange.shade400,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.card_travel_outlined,
                  size: 40,
                )),
            SizedBox(
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
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                // Container(
                //   width: 380,
                //   height: 200,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage(imgs[5]), fit: BoxFit.cover),
                //       borderRadius: BorderRadius.all(Radius.circular(10))),
                //   child: CarouselSlider(),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Popular Items',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return ItemTiles(
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                                itemCount: imgs.length)),
                      ),
                      const SizedBox(
                        child: Text(
                          'Recommended Items',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return ItemTiles(
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                                itemCount: imgs.length)),
                      ),
                      const SizedBox(
                        child: Text(
                          'Mobiles Items',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return ItemTiles(
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                                itemCount: imgs.length)),
                      ),
                      const SizedBox(
                        child: Text(
                          'Sports Items',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return ItemTiles(
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                                itemCount: imgs.length)),
                      ),
                      const SizedBox(
                        child: Text(
                          'Health Items',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 190,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return ItemTiles(
                                    index: index,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return const SizedBox(
                                    width: 8,
                                  );
                                },
                                itemCount: imgs.length)),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
