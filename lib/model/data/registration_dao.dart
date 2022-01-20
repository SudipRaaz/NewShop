import 'package:cloud_firestore/cloud_firestore.dart';
import 'registration_data.dart';

class Registration_Dao {
  // firebase collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('UserData');
  // save user data in firebase
  void saveUser(Registration registration, userID) {
    collection.doc(userID).set(registration.toJson());
  }

  // get userData
  Stream<QuerySnapshot> getUserData() {
    return collection.snapshots();
  }
}
