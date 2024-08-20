
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addDetails(Map<String, dynamic> detailsinfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('Expanse_Tracking')
          .doc(id)
          .set(detailsinfoMap);
    } catch (e) {
      throw e;
    }
  }

  Future<Stream<QuerySnapshot>> getDetails() async {
    return FirebaseFirestore.instance
        .collection('Expanse_Tracking')
        .snapshots();
  }
  Future updateDetails(String id ,Map<String ,dynamic> updateDetails)async{
await FirebaseFirestore.instance.collection('Expanse_Tracking').doc(id).update(updateDetails );
  }

    Future deleteDetails(String id)async{
await FirebaseFirestore.instance.collection('Expanse_Tracking').doc(id).delete();
  }
}











// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseMethods {
//   Future addDetails(Map<String, dynamic> detailsinfoMap, String id) async {
//     return await FirebaseFirestore.instance
//         .collection('Expanse_Traking')
//         .doc(id)
//         .set(detailsinfoMap);
//   }

//   Future<Stream<QuerySnapshot>> getDetails() async {
//     return await FirebaseFirestore.instance
//         .collection('Expanse_Tranking')
//         .snapshots();
//   }
// }