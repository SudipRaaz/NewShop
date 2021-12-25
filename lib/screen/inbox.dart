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
            title: Text('Inbox and NOtification'),
            centerTitle: true,
            backgroundColor: Colors.orange.shade400,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Chat  '),
                      Icon(Icons.chat),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Notification '),
                      Icon(Icons.notifications),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Chat(),
              Inbox_Notification(),
            ],
          )));
}
