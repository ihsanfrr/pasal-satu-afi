part of '../screens.dart';

class ForumEditScreen extends GetView<ForumEditController> {
  const ForumEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: PSColor.primary,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      PSTextfield.input(
                        controller: controller.titleController,
                        autofocus: true,
                        minLines: 1,
                        maxLines: 5,
                        hintText: "Judul Diskusi",
                        hintStyle: PSTypography.semibold.copyWith(
                          fontSize: 20,
                          color: PSColor.secondary.withOpacity(0.6),
                        ),
                        style: PSTypography.semibold.copyWith(
                          fontSize: 20,
                          color: PSColor.primary,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      PSTextfield.input(
                        controller: controller.descController,
                        minLines: 1,
                        maxLines: 20,
                        hintText: "Masukkan pesan...",
                        hintStyle: PSTypography.regular.copyWith(
                          fontSize: 14,
                          color: PSColor.secondary.withOpacity(0.6),
                        ),
                        style: PSTypography.regular.copyWith(
                          fontSize: 14,
                          color: PSColor.primary,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => PSButton.textOnly(
                    text: "KIRIM",
                    width: 100,
                    height: 45,
                    isLoading: controller.state.value == ForumEditState.loading,
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await controller.save();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
