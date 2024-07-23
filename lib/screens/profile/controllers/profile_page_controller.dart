part of '../../screens.dart';

class ProfilePageController extends GetxController {
  AppController appController = Get.find<AppController>();

  late TextEditingController emailController;
  late TextEditingController nameController;

  @override
  void onInit() {
    emailController = TextEditingController(text: appController.user!.email);
    nameController =
        TextEditingController(text: appController.user!.displayName);
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    super.onClose();
  }

  void updateProfile() {
    appController.user!.updateDisplayName(nameController.text);
    UserDatabase.updateUser(appController.user!.uid, nameController.text);
    Get.back(result: nameController.text);
  }
}
