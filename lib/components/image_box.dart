import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({Key? key}) : super(key: key);

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
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
        print("no file selected");
      }
    });
  }

  // File? _imageFile;

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;

  //     setState(() {
  //       this._imageFile = File(image.path);
  //     });
  //   } on PlatformException catch (e) {
  //     print('failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: imagePickerMethod,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                // image: DecorationImage(image: AssetImage('ass')),
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(15))),
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
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
