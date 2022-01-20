import 'package:flutter/material.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';

// ignore: camel_case_types, must_be_immutable
class categoryTiles extends StatelessWidget {
  // storing field values from previous class stream
  String title;
  String pcategory;
  String downloadURL;
  String description;
  String productID;
  int price;
  String sellerID;
  String sellerName;
  String sellerPhone;

  categoryTiles({
    Key? key,
    required this.title,
    required this.price,
    required this.pcategory,
    required this.downloadURL,
    required this.description,
    required this.productID,
    required this.sellerID,
    required this.sellerName,
    required this.sellerPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            ),
          ),
        );
      },
      // *********************************individual list tile in sub-category page********************************/
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("$downloadURL"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.orange.shade200),
            ),
            Container(
              alignment: Alignment.centerLeft,
              constraints: const BoxConstraints(maxWidth: 170),
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  '$title',
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Rs. $price',
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
