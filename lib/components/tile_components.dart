import 'package:flutter/material.dart';
import 'package:second_shopp/model/images.dart';

class ItemTiles extends StatelessWidget {
  // final String imageURL;
  int index = 0;

  ItemTiles({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.red,
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Images.images[index]), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.cyanAccent),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 130),
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                'title of the product which is very long and does not fit',
                maxLines: 1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Price: Rs 999',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
