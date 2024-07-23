part of 'databases.dart';

class UserDatabase {
  static CollectionReference articleCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(String uid, String name) async {
    await articleCollection.doc(uid).update({'fullName': name});
  }
}
