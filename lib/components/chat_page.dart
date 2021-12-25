import 'package:flutter/material.dart';

import 'message_tiles.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return MessageTile(imageIndex: index);
          }),
    );
  }
}
