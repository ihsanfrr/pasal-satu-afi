part of '../../screens.dart';

class HomeController extends GetxController {
  AppController app = Get.find<AppController>();

  List<String> featureIcons = ["regulation.svg", "article.svg", "forum.svg"];
  List<String> featureNames = ["Peraturan", "Artikel", "Forum"];
  List<ArticleModel>? articles;

  @override
  void onInit() {
    super.onInit();
    getArticles();
  }

  void getArticles() async {
    final snapshot = await ArticleDatabase().getPopularArticles()
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
