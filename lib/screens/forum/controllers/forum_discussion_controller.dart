part of '../../screens.dart';

enum SendDiscussionStatus { initial, loading, success, error }

class ForumDiscussionController extends GetxController {
  AppController app = Get.find<AppController>();

  late ForumModel forum;

  late ScrollController scrollController;
  late TextEditingController textController;
  late FocusNode focusNode;

  SendDiscussionStatus sendDiscussionStatus = SendDiscussionStatus.initial;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    textController = TextEditingController();
    focusNode = FocusNode();
    forum = Get.arguments as ForumModel;
  }

  @override
  void onClose() {
    scrollController.dispose();
    textController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  Future<void> onFieldSubmitted() async {
    if (!isTextFieldEnable) return;

    sendDiscussionStatus = SendDiscussionStatus.loading;
    update();

    DiscussionModel discussion = DiscussionModel(
      user: {
        "uid": app.user!.uid,
        "fullName": app.user!.displayName,
        "photoUrl": app.user!.photoURL,
      },
      forumId: forum.reference!.id,
      content: textController.text,
      createdAt: Timestamp.now(),
      updatedAt: null,
      deletedAt: null,
    );

    await forum.reference!
        .collection("discussions")
        .add(discussion.toFirestore());

    animateToBottom();

    textController.text = '';
    sendDiscussionStatus = SendDiscussionStatus.success;
    update();
  }

  void animateToBottom({bool isInitial = false}) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + (isInitial ? 0 : 100),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void onFieldChanged(String term) {
    update();
  }

  bool get isTextFieldEnable => textController.text.isNotEmpty;
}
