import 'package:flutter/material.dart';
import 'package:second_shopp/model/images.dart';

import '../theme_data.dart';

class MessageTile extends StatelessWidget {
  int imageIndex = 5;
  MessageTile({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        // child:
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            // color: Colors.deepOrange,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(Images.images[imageIndex]),
                    backgroundColor: Colors.brown,
                    radius: 35,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Message vvvvvvvvvvv ',
                      style: SecondShopTheme.lightTextTheme.caption,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                )
              ],
            ));
    // ),
    // );
  }
}
