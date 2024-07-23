part of '../../screens.dart';

class ChatConversationController extends GetxController {
  late ScrollController scrollController;
  late TextEditingController textController;
  late FocusNode focusNode;
  List<ConversationModel> chatList = [
    ConversationModel(
      questionId: 'questionId',
      sender: 'user',
      text:
          'Saya baru saja di-PHK tanpa alasan yang jelas. Apa yang harus saya lakukan?',
      attachments: '',
      createdAt: Timestamp.fromDate(DateTime.now()),
    ),
  ];

  @override
  void onInit() {
    scrollController = ScrollController();
    textController = TextEditingController();
    focusNode = FocusNode();
    aiAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void sendMessage() async {
    if (textController.text.isEmpty) return;

    chatList.add(
      ConversationModel(
        questionId: 'questionId',
        sender: 'user',
        text: textController.text,
        attachments: '',
        createdAt: Timestamp.now(),
      ),
    );

    textController.clear();
    update();

    await aiAnswer();

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    // GenerativeModel model = GenerativeModel(
    //   model: 'gemini-1.5-flash-latest',
    //   apiKey: dotenv.env['API_KEY']!,
    // );

    // model.generateContent([Content.text(textController.text)]).then(
    //   (answer) {
    //     debugPrint(answer.text.toString());
    //   },
    // );
  }

  Future aiAnswer() async {
    Future.delayed(const Duration(seconds: 1));
    if (chatList.length == 1) {
      chatList.add(
        ConversationModel(
          questionId: 'questionId',
          sender: 'ai',
          text:
              'Wah, turut prihatin atas kejadiannya. Sebelum menuntut, ada beberapa hal yang perlu Anda perhatikan: Bukti PHK: Pastikan Anda memiliki surat PHK atau dokumen lain yang sah, Alasan PHK: Cari tahu alasan PHK dari perusahaan, meskipun tidak wajib diberitahukan dan Upaya negosiasi: Coba selesaikan masalah dengan perusahaan secara damai terlebih dahulu.',
          attachments: '',
          createdAt: Timestamp.fromDate(DateTime.now()),
        ),
      );
      update();
    } else if (chatList.length == 3) {
      chatList.add(
        ConversationModel(
          questionId: 'questionId',
          sender: 'ai',
          text:
              'Jika sudah, Anda berhak untuk menuntut perusahaan. Untuk itu, sebaiknya konsultasi dengan pengacara untuk mendapatkan langkah hukum yang tepat.',
          attachments: '',
          createdAt: Timestamp.fromDate(DateTime.now()),
        ),
      );
      update();
    } else if (chatList.length == 5) {
      chatList.add(ConversationModel(
        questionId: 'questionId',
        sender: 'ai',
        text:
            'Maaf saya tidak bisa menemukan informasi terkait pengacara di sekitar Anda. Namun, Anda bisa mencari informasi pengacara di internet atau konsultasi dengan LBH Indonesia.',
        attachments: '',
        createdAt: Timestamp.fromDate(DateTime.now()),
      ));
      update();
    } else if (chatList.length == 7) {
      chatList.add(
        ConversationModel(
          questionId: 'questionId',
          sender: 'ai',
          text:
              'Sama-sama. Jangan ragu untuk hubungi saya jika ada pertanyaan lain.',
          attachments: '',
          createdAt: Timestamp.fromDate(DateTime.now()),
        ),
      );
      update();
    }
  }

  void onFieldChanged(String term) {
    update();
  }
}
