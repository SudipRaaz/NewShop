import 'package:flutter/material.dart';

class BuyItem extends StatelessWidget {
  const BuyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        // color: Colors.blueGrey,
                        decoration: BoxDecoration(
                          // image: DecorationImage(image: NetworkImage("")),
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      // child: Container(
                      //   color: Colors.indigoAccent,
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          RowData(
                            title: "Title ",
                            name: "Product name",
                            icon: Icons.favorite_border_outlined,
                          ),
                          RowData(title: "Price ", name: "Rs 999"),
                          RowData(title: "Category ", name: "Product Category"),
                          RowData(
                              title: "Description ",
                              name:
                                  "Product Category bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.orange.shade400,
                                  backgroundImage: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/secondshopp-f510b.appspot.com/o/DefaultPictures%2Fuser.png?alt=media&token=0a4f1565-673e-4953-b087-3b6ed584afb6")),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: const [
                                  Text(
                                    "Seller Name",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'contact: info',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Spacer(),
                              MaterialButton(
                                padding: const EdgeInsets.all(12),
                                color: Colors.orange.shade200,
                                // shape: Border.all(color: Colors.orange.shade900),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {},
                                child: const Text(
                                  "Message",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            // SizedBox(
            //   height: 100,
            //   child: Container(
            //     color: Colors.orange,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 8,
                    padding: const EdgeInsets.all(12),
                    color: Colors.orange.shade300,
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  MaterialButton(
                    elevation: 8,
                    padding: const EdgeInsets.all(12),
                    color: Colors.orange.shade300,
                    onPressed: () {},
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  String title;
  String name;
  IconData? icon;
  RowData({Key? key, required this.title, required this.name, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
            child: Text(
          "$name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
        Icon(
          icon,
          size: 40,
        )
      ],
    );
  }
}
