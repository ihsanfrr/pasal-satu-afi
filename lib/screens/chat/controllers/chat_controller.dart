part of '../../screens.dart';

class ChatController extends GetxController {
  late TextEditingController textController;
  RxBool sendButtonEnabled = false.obs;

  List<String> suggestions = [
    'Saya baru saja di-PHK tanpa alasan yang jelas. Apa yang harus saya lakukan?',
    'Berapa kisaran biaya jasa pengacara untuk perkara perdata?',
    'Bagaimana cara melaporkan tindak pidana penipuan?',
    'Apa saja tips untuk menghadapi persidangan?',
  ];

  List<String> chatHistory = [
    'Apa itu arbitrase dan bagaimana cara kerjanya?',
    'Bisakah saya menyelesaikan perkara hukum ini secara damai?',
    'Apa yang termasuk dalam harta bersama suami istri?',
    'Perusahaan memotong gaji saya secara sepihak. Apakah ini sah?'
  ];

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  onMessageChanged(String value) {
    if (value.isNotEmpty) {
      sendButtonEnabled.value = true;
    } else {
      sendButtonEnabled.value = false;
    }
  }

  void suggestionChat(String suggestion) {
    textController.text = suggestion;
    sendButtonEnabled.value = true;
  }
}
