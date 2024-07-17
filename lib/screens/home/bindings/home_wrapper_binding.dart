part of '../../screens.dart';

class HomeWrapperBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeWrapperController());
    Get.put(HomeController());
    Get.put(ProfileController());
  }
}
