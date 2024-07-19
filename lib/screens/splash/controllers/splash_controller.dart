part of '../../screens.dart';

class SplashController extends GetxController {
  AppController app = Get.find<AppController>();
  RxString selectedText = "Solusi hukum terdepan dengan AI.".obs;

  @override
  void onInit() {
    super.onInit();

    randomText();
    startTimer();
    ever(app.isAuthenticated, (_) => Get.offNamed(Routes.splash));
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

  String isAuthenticated() =>
      app.isAuthenticated.isTrue ? Routes.home : Routes.login;

  void startTimer() => Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(
          isAuthenticated(),
        ),
      );
}
