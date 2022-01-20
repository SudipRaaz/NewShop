import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/model/tab_manager.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // instance of firebase authetication service
  final _auth = FirebaseAuth.instance;

  String? documentId = '';

  double iconSize = 50;

  late double rating = 4;

  bool isVisible = false;

  String customerCare = 'assets/images/black_customerCare.png';
//customer care contact number
  String customerCarePhone = '+9779866115102';

  @override
  Widget build(BuildContext context) {
    //instance of tabmanger
    final tabprovider = Provider.of<TabManager>(context, listen: true);
// instance of firebase collection 'UserData'
    CollectionReference users =
        FirebaseFirestore.instance.collection('UserData');

//getting documentID
    User? userToken = _auth.currentUser;
    documentId = userToken?.uid;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        // if there is any error
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        // if data has not yet received
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        // after the connection is done return scaffold
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
                    //***********************top row for review app, customer care and sign out ***************** */
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
                            //dialog box for reviewing appliation
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
                            // go to home page
                            tabprovider.goToTab(0);
                            // sign out the user
                            _auth.signOut();
                          },
                          radius: 20,
                          splashColor: Colors.amberAccent,
                        ),
                      ],
                    ),
                  ),

                  //****************************************** user information card **************************************** */
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
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
                            backgroundImage:
                                AssetImage('assets/images/customer.png'),
                            backgroundColor: Colors.orange,
                            radius: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 250),
                                child: Text(
                                  " ${data['Name']}",
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
                  const Divider(
                    indent: 50,
                    endIndent: 50,
                    thickness: 3,
                  ),
                  //************************** cart Tiles *********************************** */
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
                          tileName: "Wish List",
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

// open whatsapp for customer support
  void openwhatsapp(context) async {
    String whatsapp = customerCarePhone;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text= I am having problem!";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    // android , web check if it can be launch or not
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Second Shop uses WhatsApp for messaging'),
              content:
                  const Text('Download WhatsApp to use messanging feature.'),
              actions: [
                TextButton(
                  // FlatButton widget is used to make a text to work like a button
                  onPressed: () {
                    Navigator.pop(context);
                  }, // function used to perform after pressing the button
                  child: const Text('CANCEL'),
                ),
                TextButton(
                  // textColor: Colors.black,
                  // redirect to downlaod whatsApp
                  onPressed: () {
                    StoreRedirect.redirect(androidAppId: 'com.whatsapp');
                  },
                  child: const Text('DOWNLOAD'),
                ),
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            );
          });
    }
  }
}

// profile wish list tile
class _ProfileTile extends StatelessWidget {
  String tileName;
  _ProfileTile({Key? key, required this.tileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //retunr the tile for profile page
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
