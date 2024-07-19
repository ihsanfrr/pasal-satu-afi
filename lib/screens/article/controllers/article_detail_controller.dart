part of '../../screens.dart';

class ArticleDetailController extends GetxController {
  late ArticleModel article;

  @override
  void onInit() {
    article = Get.arguments as ArticleModel;
    super.onInit();
  }
}
