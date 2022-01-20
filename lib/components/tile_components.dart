import 'package:flutter/material.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';

class ItemTiles extends StatelessWidget {
  // final String imageURL;

  final GestureTapCallback press;

  String title;
  String description;
  String pcategory;
  int price;
  String downloadURL;
  String productID;
  String sellerID;
  String sellerName;
  String sellerPhone;

  ItemTiles({
    Key? key,
    required this.press,
    required this.title,
    required this.description,
    required this.pcategory,
    required this.price,
    required this.downloadURL,
    required this.productID,
    required this.sellerID,
    required this.sellerName,
    required this.sellerPhone,
  }) : super(key: key);

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
                      title: this.title,
                      description: this.description,
                      pcategory: this.pcategory,
                      price: this.price,
                      downloadURL: this.downloadURL,
                      productID: this.productID,
                      sellerID: this.sellerID,
                      sellerName: this.sellerName,
                      sellerPhone: this.sellerPhone,
                    )));
      },
      child: Container(
        // color: Colors.redAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("$downloadURL"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.orange.shade200),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 150),
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
