part of '../screens.dart';

class ChatConversationScreen extends GetView<ChatConversationController> {
  const ChatConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Text(
          "PasalSatu AI",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: NotificationListener(
          onNotification: (OverscrollIndicatorNotification notification) {
            notification.disallowIndicator();
            return false;
          },
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.focusNode.unfocus();
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GetBuilder<ChatConversationController>(
                      builder: (_) {
                        return ListView.separated(
                          shrinkWrap: true,
                          reverse: false,
                          padding: const EdgeInsets.only(top: 12, bottom: 20) +
                              const EdgeInsets.symmetric(horizontal: 12),
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 12,
                          ),
                          controller: controller.scrollController,
                          itemCount: controller.chatList.length,
                          itemBuilder: (context, index) {
                            return BubbleWidget(
                              conversation: controller.chatList[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              BottomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomTextField extends StatelessWidget {
  BottomTextField({
    Key? key,
  }) : super(key: key);

  final ChatConversationController controller =
      Get.find<ChatConversationController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: controller.focusNode,
              onChanged: controller.onFieldChanged,
              controller: controller.textController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              cursorColor: PSColor.primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 42,
                  left: 16,
                  top: 18,
                ),
                hintText: 'Masukkan balasan',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // custom suffix btn
            Positioned(
              bottom: 0,
              right: 0,
              child: GetBuilder<ChatConversationController>(
                builder: (_) {
                  return IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => controller.sendMessage(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
