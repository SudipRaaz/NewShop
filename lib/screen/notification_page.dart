import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_shopp/components/notification_tile.dart';
import 'package:second_shopp/model/data/notification_dao.dart';

class Notification_page extends StatefulWidget {
  Notification_page({Key? key}) : super(key: key);

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  List notificationList = [];

  // final Stream<QuerySnapshot> studentsStream =
  //     FirebaseFirestore.instance.collection('Notifications').snapshots();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchUserInfo();
  //   fetchNotificationData();
  // }

  // fetchUserInfo() async {
  //   // FirebaseUser getUser = await FirebaseAuth.instance.currentUser();
  //   // userID = getUser.uid;
  // }

  // fetchNotificationData() async {
  //   List resultant = await Notification_Dao().getNotificationList();

  //   if (resultant == null) {
  //     print('Unable to retrieve');
  //   } else {
  //     print(resultant);
  //     setState(() {
  //       notificationList = resultant;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final notificationDao =
        Provider.of<Notification_Dao>(context, listen: false);

    final NotificationStream = Notification_Dao().getNotificationData();

    return StreamBuilder<QuerySnapshot>(
        stream: NotificationStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No New Nofications'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List notificationDocs = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            notificationDocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Notification'),
              centerTitle: true,
              backgroundColor: Colors.orange.shade400,
            ),
            body: GestureDetector(
              onTap: () {
                print(notificationDocs);
                print(notificationDocs.length);
              },
              child: Container(
                // color: Colors.blueAccent,
                padding: EdgeInsetsDirectional.only(top: 12),
                // color: Colors.purpleAccent,
                child: ListView.separated(
                  itemCount: notificationDocs.length,
                  itemBuilder: (context, int index) {
                    return (notificationDocs.isEmpty == true)
                        ? ElevatedButton(
                            onPressed: () {}, child: Text('No Notifications'))
                        : Notify_Contend(
                            Notification_title: notificationDocs[index]
                                ['Topic'],
                            description: notificationDocs[index]
                                ['Description']);
                  },
                  separatorBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.symmetric(vertical: 5));
                  },
                ),
              ),
            ),
          );
        });
  }
}
