import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_shopp/model/data/report_data.dart';

class Report_Dao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Report Post');

  void reportPost(ReportMessage reportMessage) {
    collection.add(reportMessage.toJson());
  }
}
