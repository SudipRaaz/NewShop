import 'package:flutter/material.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_subPages/cart_page.dart';
import 'package:second_shopp/components/profile_subPages/selling_page.dart';
import 'package:second_shopp/components/profile_subPages/watching_page.dart';
import 'package:second_shopp/components/profile_tile.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 50;
    String name = "Sudip Raaz ";

    List profileTileName = <String>["selg", "Cart", "Favorite"];
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.cyanAccent,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Icon(Icons.share, size: iconSize),
                  onTap: () {},
                  radius: 20,
                  splashColor: Colors.amberAccent,
                  // highlightColor:
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  radius: 20,
                  splashColor: Colors.amberAccent,
                  // highlightColor:
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/secondshopp-f510b.appspot.com/o/DefaultPictures%2Fuser.png?alt=media&token=0a4f1565-673e-4953-b087-3b6ed584afb6"),
                      backgroundColor: Colors.orange,
                      radius: 50,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text("User's Bio", style: TextStyle(fontSize: 15)),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartItems()));
                  },
                  child: _ProfileTile(
                    tileName: "Cart Items",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BuyItem()));
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
