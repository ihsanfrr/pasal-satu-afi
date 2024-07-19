part of 'databases.dart';

class ArticleDatabase {
  static CollectionReference articleCollection =
      FirebaseFirestore.instance.collection('articles');

  Future<QuerySnapshot<Object?>?> getArticles() async {
    try {
      return await articleCollection
          .where("publishedAt", isNotEqualTo: null)
          .orderBy("publishedAt", descending: true)
          .get();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<QuerySnapshot<Object?>?> getPopularArticles() async {
    try {
      return await articleCollection
          .where("isPopular", isEqualTo: true)
          .where("publishedAt", isNotEqualTo: null)
          .orderBy("publishedAt", descending: true)
          .get();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
