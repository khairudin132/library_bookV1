import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String email;
  Timestamp accountCreated;
  String fullName;
  String groupId;
  String notifToken;

  User({
    this.uid,
    this.email,
    this.accountCreated,
    this.fullName,
    this.groupId,
    this.notifToken,
  });

  User.fromDocumentSnapshot({DocumentSnapshot doc}) {
    uid = doc.documentID;
    email = doc.data['email'];
    accountCreated = doc.data['accountCreated'];
    fullName = doc.data['fullName'];
    groupId = doc.data['groupId'];
    notifToken = doc.data['notifToken'];
  }
}
