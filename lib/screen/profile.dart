import 'package:flutter/material.dart';
// import 'package:second_shop/components/Authetication/login_page.dart';
// import 'package:second_shop/components/profile_subPages/cart_page.dart';
// import 'package:second_shop/components/profile_subPages/selling_page.dart';
// import 'package:second_shop/components/profile_subPages/watching_page.dart';

// import 'package:flutter/material.dart';
import 'package:second_shopp/components/Authetication/login_page.dart';
import 'package:second_shopp/components/profile_tile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 50;
    String name = "Sudip Raaz ";

    List profileTileName = <String>["selling", "Cart", "Favorite"];
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
                  onTap: () {},
                  radius: 20,
                  splashColor: Colors.amberAccent,
                  // highlightColor:
                ),
                InkWell(
                  child: Icon(Icons.logout, size: iconSize),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
                      backgroundColor: Colors.amberAccent,
                      radius: 50,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
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
                SizedBox(
                  height: 20,
                ),
                Profile_tile(tile_name: profileTileName[0]),
                Profile_tile(tile_name: profileTileName[1]),
                Profile_tile(tile_name: profileTileName[2]),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
