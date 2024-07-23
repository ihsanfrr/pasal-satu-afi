part of '../../screens.dart';

class ChatHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatHistoryController());
  }
}
