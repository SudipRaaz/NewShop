import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            //children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0x0fff9800),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0, top: 7),
                            child: CircleAvatar(
                              radius: 20,
                              //backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    Text(
                                      'price: Rs.999',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
