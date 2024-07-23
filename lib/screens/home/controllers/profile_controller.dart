part of '../../screens.dart';

class ProfileController extends GetxController {
  AppController app = Get.find<AppController>();

  Rx<String?> name = ''.obs;
  Rx<String?> email = ''.obs;

  @override
  void onInit() {
    name.value = app.user!.displayName;
    email.value = app.user!.email;
    super.onInit();
  }

  reload() {
    FirebaseAuth.instance.currentUser!.reload();
    name.value = FirebaseAuth.instance.currentUser!.displayName;
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    app.checkAuth();
  }
}
