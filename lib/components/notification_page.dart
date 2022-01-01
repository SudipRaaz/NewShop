import 'package:flutter/material.dart';

import 'notification_tile.dart';

class Inbox_Notification extends StatefulWidget {
  const Inbox_Notification({Key? key}) : super(key: key);

  @override
  _Inbox_NotificationState createState() => _Inbox_NotificationState();
}

class _Inbox_NotificationState extends State<Inbox_Notification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 12),
      // color: Colors.purpleAccent,
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, int index) {
          return Notify_Contend(
            Notification_title: 'Verification',
            description:
                'phone number bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
          );
        },
        separatorBuilder: (context, index) {
          return Padding(padding: EdgeInsets.symmetric(vertical: 5));
        },
      ),
      // Notify_tile(),
    );
  }
}
