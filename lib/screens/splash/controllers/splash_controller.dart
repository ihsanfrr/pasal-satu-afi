part of '../../screens.dart';

class SplashController extends GetxController {
  RxString selectedText = "Solusi hukum terdepan dengan AI.".obs;

  @override
  void onInit() {
    super.onInit();

    randomText();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.login),
    );
  }

  List<String> list = [
    "Solusi hukum terdepan dengan AI.",
    "Pelajari peraturan perundang-undangan di Indonesia.",
    "Temukan solusi terbaik untuk permasalahan Anda.",
    "Wujudkan masa depan yang lebih adil bersama PasalSatu."
  ];

  void randomText() {
    Random random = Random();
    int index = random.nextInt(list.length);
    selectedText.value = list[index];
  }
}
