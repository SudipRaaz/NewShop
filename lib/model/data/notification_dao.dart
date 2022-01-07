import 'package:cloud_firestore/cloud_firestore.dart';

class Notification_Dao {
  final CollectionReference notificationcollection =
      FirebaseFirestore.instance.collection('Notifications');

  Stream<QuerySnapshot> getNotificationData() {
    return notificationcollection.snapshots();
  }
}
