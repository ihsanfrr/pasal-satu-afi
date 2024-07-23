part of 'databases.dart';

class ForumDatabase {
  static CollectionReference forumCollection =
      FirebaseFirestore.instance.collection('forums');

  Stream<QuerySnapshot<Object?>?> streamForums() {
    return forumCollection
        .where("deletedAt", isEqualTo: null)
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Future<bool> addForum(ForumModel forum) async {
    try {
      await forumCollection.add(forum.toFirestore());

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
