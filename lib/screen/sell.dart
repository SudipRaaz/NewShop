import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/image_box.dart';
import 'package:second_shopp/data/sell_dao.dart';
import 'package:second_shopp/data/sell_data.dart';

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
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  ImageBox(),
                  ImageBox(),
                  ImageBox(),
                  ImageBox(),
                ],
              ),
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
                  _storeSellItems(sellDao);
                  final snackBar = SnackBar(
                    content: Text('Sell button pressed'),
                    action: SnackBarAction(
                      label: "Dismiss",
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  // Widget _getMessageList(Sell_Dao sellDao) {
  //   return Expanded(
  //     // 1
  //     child: StreamBuilder<QuerySnapshot>(
  //       // 2
  //       stream: sellDao.getMessageStream(),
  //       // 3
  //       builder: (context, snapshot) {
  //         // 4
  //         if (!snapshot.hasData)
  //           return const Center(child: LinearProgressIndicator());
  //         // 5
  //         return _buildList(context, snapshot.data!.docs);
  //       },
  //     ),
  //   );
  // }

  // // TODO: Add _buildList
  // Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
  //   return ListView(
  //     // physics: const BouncingScrollPhysics(),
  //     padding: const EdgeInsets.only(top: 20),
  //     children: snapshot!.map((data) => _buildListItem(context, data)).toList(),
  //   );
  // }

  // // TODO: Add _buildListItem
  // Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
  //   final message = Message.fromSnapshot(snapshot);
  //   return MessageWidget(message.text, message.date, message.email);
  // }
}
