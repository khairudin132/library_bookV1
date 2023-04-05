import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_book/model/user.dart';

class DBStream {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<UserModel> getCurrentUser(String uid) {
    return _fireStore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(doc: docSnapshot));
  }
}
