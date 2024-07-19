part of '../../screens.dart';

class ArticleController extends GetxController {
  List<ArticleModel>? articles;

  @override
  void onInit() {
    super.onInit();
    getArticles();
  }

  void getArticles() async {
    final snapshot = await ArticleDatabase().getArticles()
        as QuerySnapshot<Map<String, dynamic>>?;
    if (snapshot == null) {
      articles = [];
      update();
      return;
    }

    articles = snapshot.docs.map((e) => ArticleModel.fromFirestore(e)).toList();
    update();
  }
}
