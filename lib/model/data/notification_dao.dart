import 'package:cloud_firestore/cloud_firestore.dart';

class Notification_Dao {
  // firebase collection reference
  final CollectionReference notificationcollection =
      FirebaseFirestore.instance.collection('Notifications');
  // get the stream from firebase
  Stream<QuerySnapshot> getNotificationData() {
    return notificationcollection.snapshots();
  }
}
