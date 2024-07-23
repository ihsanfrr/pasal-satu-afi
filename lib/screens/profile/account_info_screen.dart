part of '../screens.dart';

class AccountInfoScreen extends GetView<ProfilePageController> {
  const AccountInfoScreen({super.key});

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
          "Informasi Akun",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: PSTypography.regular,
              ),
              const SizedBox(height: 8),
              PSTextfield.input(
                controller: controller.emailController,
                enabled: false,
              ),
              const SizedBox(height: 16),
              const Text(
                "Nama Lengkap",
                style: PSTypography.regular,
              ),
              const SizedBox(height: 8),
              PSTextfield.input(
                controller: controller.nameController,
              ),
              const SizedBox(height: 16),
              PSButton.textOnly(
                text: "SIMPAN",
                onTap: () => controller.updateProfile(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
