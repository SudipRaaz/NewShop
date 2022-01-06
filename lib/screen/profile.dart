import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/components/profile_subPages/selling_page.dart';
import 'package:second_shopp/components/profile_subPages/watching_page.dart';
import 'package:second_shopp/components/profile_tile.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/model/tab_manager.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final _auth = FirebaseAuth.instance;

  // String profileImg = '';

  String? documentId = '';
  double iconSize = 50;

  @override
  Widget build(BuildContext context) {
    final tabprovider = Provider.of<TabManager>(context, listen: true);

    CollectionReference users =
        FirebaseFirestore.instance.collection('UserData');

    User? userToken = _auth.currentUser;
    documentId = userToken?.uid;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                // color: Colors.cyanAccent,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(Icons.share, size: iconSize),
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (BuildContext context) {
                          //       return const AlertDialog(
                          //         content: Text('Alert!'),
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(2.0))),
                          //       );
                          //     });
                          User? userToken = _auth.currentUser;
                          String? userID = userToken?.uid;
                          String date = DateTime.now().minute.toString();
                          String date2 = DateTime.now().hour.toString();
                          String date3 = DateTime.now().toString();
                          print("date min = $date");
                          print("date hour = $date2");
                          print("date hour = $date3");
                        },
                        radius: 20,
                        splashColor: Colors.amberAccent,
                      ),
                      InkWell(
                        child: Icon(Icons.settings, size: iconSize),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartItems()));
                        },
                        radius: 20,
                        splashColor: Colors.amberAccent,
                        // highlightColor:
                      ),
                      InkWell(
                        child: Icon(Icons.logout, size: iconSize),
                        onTap: () {
                          tabprovider.goToTab(0);

                          _auth.signOut();

                          // Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        radius: 20,
                        splashColor: Colors.amberAccent,
                        // highlightColor:
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  //****************************************** user profile **************************************** */
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc"),
                            backgroundColor: Colors.orange,
                            radius: 50,
                          ),
                          // const SizedBox(
                          //   width: 8,
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " ${data['Name']}",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  children: [
                                    const Text("   contact: ",
                                        style: TextStyle(fontSize: 15)),
                                    Text(
                                      "${data['Phone']}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(" Email: ",
                                      style: TextStyle(fontSize: 15)),
                                  Text(
                                    "${data['email']}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // *************************divider ***********************************
                  SizedBox(
                    height: 3,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartItems()));
                        },
                        child: _ProfileTile(
                          tileName: "Cart Items",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => BuyDetail_Page(press: ,)));
                        },
                        child: _ProfileTile(
                          tileName: "Watching Items",
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          );
        }
        ;

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // FirebaseFirestore.instance
    //     .collection('user data')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     setState(() {
    //       username = doc['Name'];
    //       userPhone = doc['Phone'];
    //     });
    //   });
    // }
    // );
//************************************************************************************************* */
    // FirebaseFirestore.instance
    //     .collection('UserData')
    //     .doc('j8iuhBWwzct6U0OEpP0X')
    //     .get(),
    //     Builder
    //     {
    //   if (documentSnapshot.exists) {
    //     print('Document data: ${documentSnapshot.data()}');
    //     Map<String, dynamic> userData =
    //         documentSnapshot.data() as Map<String, dynamic>;
    //     setState(() {
    //       username = userData['Name'];
    //       userPhone = userData['Phone'];
    //     });
    //   } else {
    //     print('Document does not exist on the database');
    //   }
    // });

    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    // FutureBuilder<DocumentSnapshot>(
    //     future: users.doc('O3sY4JCTLKVJwPdesJDJ').get(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return Text("Something went wrong");
    //       }

    //       if (snapshot.hasData && !snapshot.data!.exists) {
    //         return Text("Document does not exist");
    //       }

    //       if (snapshot.connectionState == ConnectionState.done) {
    //         Map<String, dynamic> data =
    //             snapshot.data!.data() as Map<String, dynamic>;
    //         // setState(() {
    //         //   username = data['Name'];
    //         //   userPhone = data['Phone'];
    //         // });
    //         return Text("Full Name: ${data['full_name']} ${data['last_name']}");
    //       }
    //     });
  }

  // _getImage() async {
  //   // var collection = FirebaseFirestore.instance.collection('image1');
  //   // var querySnapshot = await collection.get();
  //   // for (var queryDocumentSnapshot in querySnapshot.docs) {
  //   //   Map<String, dynamic> data = queryDocumentSnapshot.data();
  //   //   var name = data['name'];
  //   //   var phone = data['phone'];
  //   // }

  //   FirebaseFirestore.instance
  //       .collection('DefaultData')
  //       .doc()
  //       .snapshots()
  //       .listen((event) {
  //     setState(() {
  //       profileImg = event.data()!['image1'];
  //     });
  //   });
  // }
}

class _ProfileTile extends StatelessWidget {
  String tileName;
  _ProfileTile({Key? key, required this.tileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tileName,
              style: const TextStyle(fontSize: 25),
            ),
            // Spacer(),
            const Icon(
              Icons.play_arrow_outlined,
              size: 45,
            )
          ],
        ),
      ),
    );
  }
}
