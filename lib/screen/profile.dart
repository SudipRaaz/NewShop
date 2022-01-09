import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/components/profile_subPages/selling_page.dart';
import 'package:second_shopp/components/profile_subPages/watching_page.dart';
import 'package:second_shopp/components/profile_tile.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/model/tab_manager.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  // String profileImg = '';
  String? documentId = '';

  double iconSize = 50;

  late double rating = 4;

  bool isVisible = false;

  String customerCare = 'assets/images/black_customerCare.png';

  String customerCarePhone = '9846420632';

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

        if (!snapshot.hasData) {
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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/review_logo.png')))),
                          onTap: () {
                            showCupertinoDialog<void>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                title: const Text(
                                  'App Rating',
                                  style: TextStyle(fontSize: 25),
                                ),
                                content: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Please rate our application',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    RatingBar.builder(
                                        itemCount: 5,
                                        initialRating: 4,
                                        minRating: 1,
                                        glowColor: Colors.orange.shade200,
                                        itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                        onRatingUpdate: (value) {
                                          rating = value;
                                        }),
                                  ],
                                ),
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    child: const Text('later'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: const Text('Yes'),
                                    onPressed: () {
                                      print('Rating given: $rating');
                                      if (rating > 3) {
                                        StoreRedirect.redirect(
                                            androidAppId:
                                                'com.shambhug.myapplication');
                                      } else {
                                        setState(() {
                                          isVisible = true;
                                          customerCare =
                                              'assets/images/green_customerCare.png';
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                            print('rating pressed');
                          },
                          radius: 20,
                          splashColor: Colors.amberAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(customerCare)))),
                          onTap: () {
                            openwhatsapp(context);
                          },
                          radius: 20,
                          splashColor: Colors.amberAccent,
                        ),
                        Visibility(
                            visible: isVisible,
                            child: const Text(
                              'Customer\nSupport',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 17),
                            )
                            // visible: isVisible,
                            ),
                        const Spacer(),
                        InkWell(
                          child: Icon(
                            Icons.logout,
                            size: iconSize,
                            color: Colors.redAccent,
                          ),
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
                              Container(
                                constraints: BoxConstraints(maxWidth: 250),
                                child: Text(
                                  " ${data['Name']}",
                                  // 'fff fffff ffffff ffffff ff ffffff ffffff',
                                  // 'sudip raj adhikari form chitwan',
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  children: [
                                    const Text("   contact: ",
                                        style: TextStyle(fontSize: 15)),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 175),
                                      child: Text(
                                        "${data['Phone']}",
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(" Email: ",
                                      style: TextStyle(fontSize: 15)),
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 197),
                                    child: Text(
                                      "${data['email']}",
                                      // maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
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

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void openwhatsapp(context) async {
    String whatsapp = customerCarePhone;
    var whatsappURl_android = "whatsapp://send?phone=";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("I have some problems with Second Shop Application. Would you help me?")}";

    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Second Shop uses WhatsApp for messaging'),
              content: Text('Download WhatsApp to use messanging feature.'),
              actions: [
                TextButton(
                  // FlatButton widget is used to make a text to work like a button
                  onPressed: () {
                    Navigator.pop(context);
                  }, // function used to perform after pressing the button
                  child: Text('CANCEL'),
                ),
                TextButton(
                  // textColor: Colors.black,
                  onPressed: () {
                    StoreRedirect.redirect(androidAppId: 'com.whatsapp');
                  },
                  child: Text('DOWNLOAD'),
                ),
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
          });
    }
  }

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
            child: Container(),
          );
        });
  }
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
          color: Colors.orange.shade300,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
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
