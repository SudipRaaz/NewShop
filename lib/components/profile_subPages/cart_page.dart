import 'package:flutter/material.dart';
import 'package:second_shopp/globals.dart' as globals;

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // ignore: prefer_const_constructors
            title: Text('On Cart'),
            backgroundColor: Colors.orange.shade400,
            leading: const BackButton(color: Colors.black)),
        // list builder to list the wish list items
        body: ListView.builder(
            itemBuilder: (context, index) => (globals.cartItems.length != 0)
                ? CartTile(
                    globals.cartItems[index]['downloadURL'],
                    globals.cartItems[index]['title'],
                    globals.cartItems[index]['description'],
                    globals.cartItems[index]['price'])
                : SizedBox(),
            itemCount: globals.cartItems.length));
  }

  // cart tile widget for each items in the wish list
  Widget CartTile(pimage, ptitle, pdescription, pprice) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      // ignore: deprecated_member_use
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 12, 15, 12),
        color: const Color.fromARGB(255, 255, 237, 209),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 15),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 3, right: 20),
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                image: DecorationImage(
                                    image: NetworkImage(pimage))))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '$ptitle',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '$pdescription',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Price : Rs $pprice',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
