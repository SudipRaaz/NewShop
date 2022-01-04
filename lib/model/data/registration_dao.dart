import 'package:cloud_firestore/cloud_firestore.dart';
import 'registration_data.dart';

class Registration_Dao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('UserData');

  void saveUser(Registration registration) {
    collection.add(registration.toJson());
  }

  Stream<QuerySnapshot> getUserData() {
    return collection.snapshots();
  }
}
