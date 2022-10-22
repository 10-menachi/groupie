import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection("groups");

  Future updateUserData(String name, String email) async {
    return await userCollection.doc(uid).set({
      "username": name,
      "email": email,
      "groups": [],
      "profilepic": "",
      "uid": uid
    });
  }
}
