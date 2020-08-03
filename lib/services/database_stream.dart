import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_book/model/user.dart';

class DBStream {
  Firestore _firestore = Firestore.instance;

  Stream<User> getCurrentUser(String uid) {
    return _firestore
        .collection('users')
        .document(uid)
        .snapshots()
        .map((docSnapshot) => User.fromDocumentSnapshot(doc: docSnapshot));
  }
}
