import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:second_shopp/model/data/sell_dao.dart';
import 'package:second_shopp/model/data/sell_data.dart';

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
  String? downloadURL;

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
  Future uploadImage(File _image) async {
    final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference =
        FirebaseStorage.instance.ref().child('Images').child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();

    // cloud firestore
    await firebaseFirestore
        .collection("users")
        .doc()
        .collection("images")
        .add({'downloadURL': downloadURL}).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Add MessageDao
    final sellDao = Provider.of<Sell_Dao>(context, listen: false);

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
                        decoration: BoxDecoration(
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
                                      : Icon(
                                          Icons.add_a_photo_rounded,
                                          size: 50,
                                        ),
                                  Text('Add Image'),
                                ],
                              ),
                      ),
                    ),
                  ],
                )
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: const [
                //     SizedBox(
                //       width: 15,
                //     ),
                //     ImageBox(),
                //     ImageBox(),
                //     ImageBox(),
                //     ImageBox(),
                //   ],
                // ),
                ),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title :  ',
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        height: 35,
                        child: TextFormField(
                            controller: _titleController,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                              hintText: 'Enter Product Name',
                              border: OutlineInputBorder(),
                            )),
                      ),
                      Padding(
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
                padding: EdgeInsets.all(3),
                color: Colors.orange.shade400,
                // style: const ButtonStyle(),
                onPressed: () {
                  try {
                    if (_priceController.text != null) {
                      if (_image != null) {
                        _storeSellItems(sellDao);
                        uploadImage(_image!);
                        setState(() {
                          _image = null;
                        });
                        showSnackBar("Product Added Sucessfully",
                            Duration(milliseconds: 800));
                      }
                    } else {
                      showSnackBar(
                          "Select Image first", Duration(milliseconds: 800));
                    }
                  } catch (e) {
                    showSnackBar("Error: $e", Duration(milliseconds: 800));
                  }
                },
                child: Center(
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

  void _storeSellItems(Sell_Dao sellDao) {
    final selldata = Sell_data(
      title: _titleController.text,
      description: _descriptionController.text,
      category: _categoryController.text,
      price: int.parse(_priceController.text),
    );
    sellDao.saveSellData(selldata);
    _titleController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _priceController.clear();
    setState(() {});
  }

  // uploadImage() async {
  //   final _storage = FirebaseStorage.instance;
  //   var image;

  //   //Check Permissions
  //   await Permission.photos.request();

  //   var permissionStatus = await Permission.photos.status;

  //   if (permissionStatus.isGranted){
  //     //Select Image
  //     image = await _picker.getImage(source: ImageSource.gallery);
  //     var file = File(image.path);

  //     if (image != null){
  //       //Upload to Firebase
  //       var snapshot = await _storage.ref()
  //       .child('folderName/imageName')
  //       .putFile(file);

  //       var downloadUrl = await snapshot.ref.getDownloadURL();

  //     } else {
  //       print('No Path Received');
  //     }

  //   } else {
  //     print('Grant Permissions and try again');
  //   }

  // }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
