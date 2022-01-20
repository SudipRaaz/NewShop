import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/model/data/report_dao.dart';
import 'package:second_shopp/model/data/report_data.dart';
import 'package:second_shopp/model/data/transaction.dart';
import 'package:second_shopp/model/data/transaction_dao.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:second_shopp/globals.dart' as globals;

import '../../model/data/sell_data.dart';

class BuyDetail_Page extends StatelessWidget {
  BuyDetail_Page({
    Key? key,
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

  String title;
  String downloadURL;
  String pcategory;
  String description;
  String productID;
  int price;
  String sellerID;
  String sellerName;
  String sellerPhone;

  late Map transactionData = {};

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userID = '';

  @override
  Widget build(BuildContext context) {
    User? userToken = _auth.currentUser;
    userID = userToken?.uid;

    final reportDao = Provider.of<Report_Dao>(context, listen: false);

    late final TextEditingController _reportmessageController =
        TextEditingController();

    String sellerNumber = '+977$sellerPhone';

    final transactionDao = Provider.of<Transaction_Dao>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 350,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("$downloadURL"),
                                  fit: BoxFit.cover),
                              color: Colors.orange.shade300,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Report this post'),
                                      content: TextFormField(
                                          controller: _reportmessageController,
                                          decoration: const InputDecoration(
                                              hintText: 'Reason')),
                                      actions: [
                                        TextButton(
                                          // FlatButton widget is used to make a text to work like a button
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, // function used to perform after pressing the button
                                          child: const Text(
                                            'CANCEL',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            print(
                                                _reportmessageController.text);
                                            if (_reportmessageController
                                                .text
                                                // .trim()
                                                .isNotEmpty) {
                                              await _storeReportMessage(
                                                  reportDao,
                                                  _reportmessageController
                                                      .text);
                                              _reportmessageController.clear();
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'SUBMIT',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                    );
                                  });
                              print('report button pressed');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 330, top: 7),
                              child: Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/report.png'))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          RowData(
                            title: "Title ",
                            name: "$title",
                          ),
                          RowData(title: "Price ", name: "Rs $price"),
                          RowData(
                              title: "Category ", name: pcategory.toString()),
                          RowData(
                              title: "Description ",
                              name: description.toString()),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.orange.shade400,
                                  backgroundImage: const AssetImage(
                                      'assets/images/customer.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sellerName,
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Contact: $sellerPhone',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                              Spacer(),
                              MaterialButton(
                                padding: const EdgeInsets.all(12),
                                color: Colors.orange.shade200,
                                // shape: Border.all(color: Colors.orange.shade900),
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  openwhatsapp(context, sellerNumber);
                                },
                                child: const Text(
                                  "Message",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 8,
                    padding: const EdgeInsets.all(12),
                    color: Colors.orange.shade300,
                    onPressed: () {
                      // globals.cartItems.add('items added');

                      final selldata = Sell_data(
                        productID: productID,
                        title: title,
                        description: description,
                        category: pcategory,
                        price: price,
                        downloadURL: downloadURL,
                        UserID: userID.toString(),
                        sellerName: sellerName,
                        sellerPhone: sellerPhone,
                      ).toJson();
                      // print(selldata);
                      globals.cartItems.add(selldata);
                      print(globals.cartItems);
                    },
                    child: const Text(
                      "Add To Wish List",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  MaterialButton(
                    elevation: 8,
                    padding: const EdgeInsets.all(12),
                    color: Colors.orange.shade300,
                    onPressed: () async {
                      await _sendToKhalti(transactionDao);
                    },
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendToKhalti(transactionDao) {
    double amount = double.parse(price.toString()) * 100;

    FlutterKhalti _flutterkhalti = FlutterKhalti.configure(
        publicKey: "test_public_key_ce7622a43dce4ce895e43d7a9db28111",
        urlSchemeIOS: "khaltiPayFlutterExampleSchema");

    KhaltiProduct product = KhaltiProduct(
      id: "test",
      amount: amount,
      name: "description",
    );

    _flutterkhalti.startPayment(
        product: product,
        onSuccess: (Data) {
          print("success $Data");
          transactionData = {
            'amount': (Data['amount'] / 100),
            'mobile': Data['mobile'],
            'product_identity': Data['product_identity'],
            'product_name': Data['product_name'],
            'token': Data['token'],
          };
          print('Data added to transactionData : $transactionData');
          _storeTransactionDetails(transactionDao);
        },
        onFaliure: (error) {
          print("failure msg on payment: $error");
        });
  }

  _storeReportMessage(Report_Dao report_dao, reportMessage) {
    late final ReportMessage_data = ReportMessage(
        userID: userID.toString(),
        sellerID: this.sellerID,
        message: reportMessage,
        productID: productID);
    report_dao.reportPost(ReportMessage_data);
  }

  Future<void> _storeTransactionDetails(Transaction_Dao transaction_dao) async {
    late final transaction_data = Transaction_Data(
      amount: transactionData['amount'],
      mobile: transactionData['mobile'],
      product_ID: transactionData['product_identity'],
      product_name: transactionData['product_name'],
      token: transactionData['token'],
      UserID: userID.toString(),
    );
    transaction_dao.saveTransactionData(transaction_data);
  }

  void openwhatsapp(context, sellerPhoneNum) async {
    var whatsapp = sellerPhoneNum.toString();
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("I am interested in $title")}";

    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Second Shop uses WhatsApp for messaging'),
              content: Text('Download WhatsApp to use messanging feature.'),
              actions: [
                TextButton(
                  // FlatButton widget is used to make a text to work like a button
                  onPressed: () {
                    Navigator.pop(context);
                  }, // function used to perform after pressing the button
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  // textColor: Colors.black,
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

class RowData extends StatelessWidget {
  String title;
  String name;
  IconData? icon;
  RowData({Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
            child: Text(
          "$name",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
      ],
    );
  }
}
