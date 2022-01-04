import 'package:flutter/material.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/model/images.dart';

class ItemTiles extends StatelessWidget {
  // final String imageURL;
  int index = 0;
  final GestureTapCallback press;

  ItemTiles({Key? key, required this.index, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press;
        print('pressed on tile from home page');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BuyDetail_Page()));
      },
      child: Container(
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
                      image: AssetImage(Images.images[index]),
                      fit: BoxFit.cover),
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
      ),
    );
  }
}
