part of '../../screens.dart';

class ChatController extends GetxController {
  late TextEditingController messageController;

  @override
  void onInit() {
    messageController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void sendMessage() {
    GenerativeModel model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: dotenv.env['API_KEY']!,
    );

    model.generateContent([Content.text(messageController.text)]).then(
      (answer) {
        debugPrint(answer.text.toString());
      },
    );
  }
}
