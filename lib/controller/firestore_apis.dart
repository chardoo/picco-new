import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docoradi/Models/documents/documentsModel.dart';


class FireStoreApis {
  static const int _offSet = 7;
  FirebaseFirestore? _firestore;

  Future updateMessage(uuid, Documents message) async {
    _firestore = FirebaseFirestore.instance;
    _firestore!.collection("messages").doc(uuid).update(message.toJson());
  }

  Future<Stream<List<DocumentResponse>>> getInitalDdouments() async {
    _firestore = FirebaseFirestore.instance;
    var snapshots = _firestore!
        .collection("documents")
        .orderBy("date", descending: false).limitToLast(_offSet)
      
        .snapshots();
        print("snapshot");
        print(snapshots.length);
  print(snapshots.forEach((element) {
    print(element.docs);
  }) );
    var res = snapshots
        .map((e) => e.docs.map((doc) => DocumentResponse(doc)).toList());
    return res;
  }


  Future<Stream<List<DocumentResponse>>> getInitalPersonalDdouments() async {
    _firestore = FirebaseFirestore.instance;
    var snapshots = _firestore!
        .collection("messages")
        .orderBy("date", descending: false).limitToLast(_offSet)
      
        .snapshots();

    var res = snapshots
        .map((e) => e.docs.map((doc) => DocumentResponse(doc)).toList());
    return res;
  }

}
