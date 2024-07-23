part of '../../screens.dart';

class ChatConversationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatConversationController());
  }
}
