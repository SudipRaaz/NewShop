import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:second_shopp/model/data/sell_data.dart';
import 'package:second_shopp/model/data/transaction_dao.dart';

class Sell extends StatefulWidget {
  Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  File? _image;
  final imagePicker = ImagePicker();
  String downloadURL = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userID = '';
  String sellerName = '';
  String sellerPhone = '';

  // picking the image

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 800));
      }
    });
  }

  // uploading the image to firebase cloudstore
  Future uploadImage(File _image, sellDao) async {
    try {
      final imgId = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('ProductImages')
          .child("post_$imgId");

      await reference.putFile(_image);
      downloadURL = await reference.getDownloadURL();

      // cloud firestore
      // await firebaseFirestore.collection("Products")
      //     // .doc()
      //     // .collection("Images")
      //     .add({'downloadURL': downloadURL}).whenComplete(
      //         () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
      _storeSellItems(sellDao, downloadURL);
    } catch (e) {
      showSnackBar("Error: $e", Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    User? userToken = _auth.currentUser;
    userID = userToken?.uid;
    print("userToken = $userID");

    // TODO: Add MessageDao
    final sellDao = Provider.of<Sell_Dao>(context, listen: false);

    FirebaseFirestore.instance
        .collection('UserData')
        .doc(userID)
        .snapshots()
        .listen((event) {
      sellerName = event.data()!['Name'];
      sellerPhone = event.data()!['Phone'];
      print("sellerName : $sellerName ,sellerPhone: $sellerPhone");
    });

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Quick Sell')),
          backgroundColor: Colors.orange.shade400,
        ),
        body: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          ListView(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 0, 5),
              child: SizedBox(
                child: Text(
                  'Add Image',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
                height: 300,
                // color: Colors.black38,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: imagePickerMethod,
                      child: Container(
                        height: 300,
                        width: 350,
                        decoration: const BoxDecoration(
                            // image: DecorationImage(image: AssetImage('ass')),
                            color: Colors.amberAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _image != null
                                      ? Image.file(
                                          _image!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(
                                          Icons.add_a_photo_rounded,
                                          size: 50,
                                        ),
                                  Text('Add Image'),
                                ],
                              ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Title :  ',
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        height: 35,
                        child: TextFormField(
                            controller: _titleController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: const InputDecoration(
                              hintText: 'Enter Product Name',
                              border: OutlineInputBorder(),
                            )),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          child: Text('Description : ',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 25)),
                        ),
                      ),
                      TextFormField(
                          controller: _descriptionController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Describe your Product',
                            border: OutlineInputBorder(),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          child: Text(
                            'Category : ',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextFormField(
                            controller: _categoryController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            // maxLines: 3,
                            decoration: const InputDecoration(
                              hintText: 'Choose Product Category',
                              border: OutlineInputBorder(),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Price :  ',
                              style: TextStyle(fontSize: 25),
                            ),
                            Expanded(
                              child: Container(
                                height: 35,
                                child: TextFormField(
                                    controller: _priceController,
                                    textAlign: TextAlign.start,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: const InputDecoration(
                                      label: Text('NPR'),
                                      hintText: 'Enter Selling Price',
                                      border: OutlineInputBorder(),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 100,
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 150,
              child: MaterialButton(
                padding: const EdgeInsets.all(3),
                color: Colors.orange.shade400,
                // style: const ButtonStyle(),
                onPressed: () {
                  try {
                    if (_priceController.text != null) {
                      if (_image != null) {
                        try {
                          uploadImage(_image!, sellDao);
                          setState(() {
                            _image = null;
                          });
                        } catch (e) {
                          showSnackBar(
                              "Error : $e ", Duration(milliseconds: 800));
                        }
                      }
                    } else {
                      showSnackBar(
                          "Select Image", Duration(milliseconds: 1200));
                    }
                  } catch (e) {
                    showSnackBar("Error: $e", Duration(milliseconds: 800));
                  }
                },
                child: const Center(
                  child: Text(
                    'Sell it',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  void _storeSellItems(Sell_Dao sellDao, downloadURL) {
    final selldata = Sell_data(
      productID: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      category: _categoryController.text,
      price: int.parse(_priceController.text),
      downloadURL: downloadURL,
      UserID: userID.toString(),
      sellerName: sellerName,
      sellerPhone: sellerPhone,
    );
    sellDao.saveSellData(selldata);
    _titleController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _priceController.clear();
    setState(() {});
    showSnackBar("Product Added Sucessfully", Duration(milliseconds: 800));
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
