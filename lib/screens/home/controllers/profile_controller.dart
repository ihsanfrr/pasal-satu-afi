part of '../../screens.dart';

class ProfileController extends GetxController {
  AppController app = Get.find<AppController>();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    app.checkAuth();
  }
}
