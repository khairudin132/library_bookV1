import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.accountCreated,
    this.fullName,
    this.groupId,
    this.notifyToken,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    id = doc.id;
    email = doc['email'];
    accountCreated = doc['accountCreated'];
    fullName = doc['fullName'];
    groupId = doc['groupId'];
    notifyToken = doc['notifyToken'];
  }

  UserModel copyWith({
    String? id,
    String? email,
    Timestamp? accountCreated,
    String? fullName,
    String? groupId,
    String? notifyToken,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        accountCreated: accountCreated ?? this.accountCreated,
        fullName: fullName ?? this.fullName,
        groupId: groupId ?? this.groupId,
        notifyToken: notifyToken ?? this.notifyToken,
      );

  String? id;
  String? email;
  Timestamp? accountCreated;
  String? fullName;
  String? groupId;
  String? notifyToken;
}
