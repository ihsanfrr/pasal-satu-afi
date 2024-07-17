part of '../../screens.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
