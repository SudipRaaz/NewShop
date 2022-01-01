import 'package:flutter/material.dart';
import 'package:second_shopp/components/chat_page.dart';
import 'package:second_shopp/components/notification_page.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          centerTitle: true,
          backgroundColor: Colors.orange.shade400,
        ),
        body: Inbox_Notification(),
      ));
}
