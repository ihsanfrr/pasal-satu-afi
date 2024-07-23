part of '../../screens.dart';

enum ForumEditState { initial, loading, sent }

class ForumEditController extends GetxController {
  AppController app = Get.find<AppController>();

  late TextEditingController titleController;
  late TextEditingController descController;

  Rx<ForumEditState> state = ForumEditState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }

  Future save() async {
    state.value = ForumEditState.loading;
    if (titleController.text.isEmpty || descController.text.isEmpty) {
      PSDialog.error("Judul dan deskripsi tidak boleh kosong");
      state.value = ForumEditState.initial;
    } else {
      ForumModel forum = ForumModel(
        title: titleController.text.trim(),
        description: descController.text.trim(),
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
        deletedAt: null,
        user: {
          'uid': app.user!.uid,
          'fullName': app.user!.displayName,
          'photoUrl': app.user!.photoURL,
        },
      );
      await ForumDatabase().addForum(forum);
      state.value = ForumEditState.sent;
      Get.back();
    }
  }
}
