import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/notification_tile.dart';
import 'package:second_shopp/model/data/notification_dao.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({Key? key}) : super(key: key);

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  List notificationList = [];
  @override
  Widget build(BuildContext context) {
    // object of Notification Data Access Object
    final notificationDao =
        Provider.of<Notification_Dao>(context, listen: false);
    // get the notification data from stream
    final NotificationStream = Notification_Dao().getNotificationData();

    return StreamBuilder<QuerySnapshot>(
        stream: NotificationStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          // if data has not received
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          // if connnection state is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // store the notification data in the list
          final List notificationDocs = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            // add the documentID of the notification data
            notificationDocs.add(a);
            a['id'] = document.id;
          }).toList();
          // return scaffold after the data is received
          return Scaffold(
            appBar: AppBar(
              title: const Text('Notification'),
              centerTitle: true,
              backgroundColor: Colors.orange.shade400,
            ),
            body: Container(
              padding: const EdgeInsetsDirectional.only(top: 12),
              child: ListView.separated(
                itemCount: notificationDocs.length,
                itemBuilder: (context, int index) {
                  return (notificationDocs.isEmpty)
                      ? ElevatedButton(
                          onPressed: () {},
                          child: const Text('No Notifications'))
                      : Notify_Contend(
                          Notification_title: notificationDocs[index]['Topic'],
                          description: notificationDocs[index]['Description']);
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5));
                },
              ),
            ),
          );
        });
  }
}
