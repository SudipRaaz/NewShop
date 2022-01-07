import 'package:flutter/material.dart';

class Notify_Contend extends StatelessWidget {
  String? Notification_title;
  String? description;
  IconData? symbol;
  Notify_Contend(
      {Key? key,
      required this.Notification_title,
      required this.description,
      this.symbol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Notification_title != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  // color: Colors.deepOrange[300],
                  border: Border.all(width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_active,
                  size: 38,
                ),
                title: Text('$Notification_title'),
                subtitle: Text('$description'),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 250),
            child: Text(
              "No new Nofications",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
