part of 'controllers.dart';

class AppController extends GetxController {
  RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  void checkAuth() {
    isAuthenticated.value =
        FirebaseAuth.instance.currentUser != null ? true : false;
  }

  User? get user => FirebaseAuth.instance.currentUser;
}
