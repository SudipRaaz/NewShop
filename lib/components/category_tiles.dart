import 'package:flutter/material.dart';
import 'package:second_shopp/components/profile_subPages/buy_Item.dart';
import 'package:second_shopp/model/images.dart';

class categoryTiles extends StatelessWidget {
  // final String imageURL;
  String title;
  String pcategory;
  String downloadURL;
  String description;
  int price;
  String sellerName;
  String phoneNumber;

  categoryTiles({
    Key? key,
    required this.title,
    required this.price,
    required this.pcategory,
    required this.downloadURL,
    required this.description,
    required this.sellerName,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('pressed on tile from home page');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BuyDetail_Page(
              title: this.title,
              downloadURL: this.downloadURL,
              pcategory: this.pcategory,
              description: this.description,
              price: this.price,
              sellerName: this.sellerName,
              phoneNumber: this.phoneNumber,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                height: 160,
                width: 160,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.cyanAccent),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 170),
                child: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    '$title',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23),
                    child: Text(
                      '$price',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:second_shopp/model/images.dart';

class categoryTiles extends StatelessWidget {
  // final String imageURL;
  int index = 0;

  categoryTiles({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/1.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.cyanAccent),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 170),
              child: const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  'title of the product which is very long and does not fit',
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Price: Rs 888',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14),
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
*/