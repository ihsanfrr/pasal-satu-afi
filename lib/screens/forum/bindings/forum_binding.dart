part of '../../screens.dart';

class ForumBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForumController());
  }
}
