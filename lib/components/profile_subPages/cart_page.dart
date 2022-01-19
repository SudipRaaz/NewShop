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
            leading: BackButton(color: Colors.black)),
        body: ListView.builder(
            itemBuilder: (context, index) => CartTile(),
            itemCount: globals.cartItems.length));
  }

  Widget CartTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      // ignore: deprecated_member_use
      child: Container(
        padding: EdgeInsets.all(12),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15)),
        color: Color(0x0fff9800),
        child: Row(
          children: <Widget>[
            SizedBox(width: 15),
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
                              // image:
                              //     DecorationImage(image: NetworkImage(''))
                            ))),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Title',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'price: Rs.999',
                      style: TextStyle(
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
