import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:second_shopp/model/images.dart';

class ItemTiles extends StatelessWidget {
  // final String imageURL;
  int index = 0;
  final GestureTapCallback press;

  String title = 'test';
  String pcategory = "test";
  String donwloadURL = "URL";
  String description = "description";
  int price = 200;
  String sellerName = 'seller name';
  String phoneNumber = "9806977742";
  List productsData;

  ItemTiles(
      {Key? key,
      required this.index,
      required this.press,
      required this.title,
      required this.price,
      required this.donwloadURL,
      required this.productsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(ProductsDocs);
        print('pressed on tile from home page');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuyDetail_Page(
                    title: title,
                    pcategory: this.pcategory,
                    description: this.description,
                    price: price)));
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
              child: Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  //title of the product
                  '$title',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Rs $price',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
