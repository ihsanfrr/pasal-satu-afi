part of '../screens.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PasalSatu AI",
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "Konsultasikan Hukum dengan AI",
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: MainState(),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () {
            if (controller.sendButtonEnabled.value = true) {
              controller.textController.clear();
              Get.toNamed(Routes.chatConversation);
            }
          },
          elevation: 0,
          backgroundColor: controller.sendButtonEnabled.value
              ? PSColor.primary
              : Colors.grey,
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MainState extends StatelessWidget {
  MainState({
    super.key,
  });

  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GreetingWidget(),
        const SizedBox(height: 30),
        SuggestionChatWidget(),
        const SizedBox(height: 30),
        HistoryChatWidget(),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ChatController>(
                builder: (_) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: PSTextfield.input(
                      controller: controller.textController,
                      hintText: "Tulis pesan...",
                      keyboardType: TextInputType.multiline,
                      onChanged: (p0) => controller.onMessageChanged(p0),
                      maxLines: 5,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryChatWidget extends StatelessWidget {
  HistoryChatWidget({
    super.key,
  });

  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Get.toNamed(Routes.chatAIHistory),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Terbaru",
                  style: PSTypography.medium,
                ),
                Icon(
                  Icons.chevron_right,
                  color: PSColor.primary,
                  size: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            3,
            (i) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: PSColor.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.history,
                        color: PSColor.primary,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      controller.chatHistory[i],
                      style: PSTypography.medium.copyWith(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SuggestionChatWidget extends StatelessWidget {
  SuggestionChatWidget({
    super.key,
  });

  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            controller.suggestions.length,
            (i) => GestureDetector(
              onTap: () => controller.suggestionChat(controller.suggestions[i]),
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(left: i == 0 ? 24 : 0, right: 10),
                width: (MediaQuery.of(context).size.width * 0.5),
                height: (MediaQuery.of(context).size.width * 0.3),
                decoration: BoxDecoration(
                  color: PSColor.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  children: [
                    Text(
                      controller.suggestions[i],
                      style: PSTypography.medium.copyWith(fontSize: 12),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.gavel,
                            color: PSColor.primary,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: (MediaQuery.of(context).size.width * 0.5),
            height: (MediaQuery.of(context).size.width * 0.3),
            decoration: BoxDecoration(
              border: Border.all(
                color: PSColor.primary.withOpacity(0.2),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.highlight_remove_rounded,
                    color: PSColor.primary.withOpacity(0.9),
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Sembunyikan Saran",
                    style: PSTypography.semibold.copyWith(
                        fontSize: 12, color: PSColor.primary.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Halo,",
            style: PSTypography.medium,
          ),
          Text(
            "Ihsan Fajar Ramadhan",
            style: PSTypography.semibold.copyWith(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
