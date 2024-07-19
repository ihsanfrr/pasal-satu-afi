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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              PSTextfield.input(
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
    );
  }
}
