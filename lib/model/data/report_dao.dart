import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/report_data.dart';

class Report_Dao {
  //firebase collection reference
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Report Post');

  // save report message in firebase
  void reportPost(ReportMessage reportMessage) {
    collection.add(reportMessage.toJson());
  }
}
