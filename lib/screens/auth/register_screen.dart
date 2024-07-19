part of '../screens.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Daftar Sekarang",
                  style: PSTypography.bold.copyWith(
                    fontSize: 36,
                    color: PSColor.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Langkah kecil untuk masa depan yang lebih cerah, dapatkan akses hukum di tanganmu.",
                  style: PSTypography.regular.copyWith(
                    fontSize: 12,
                    color: PSColor.secondary,
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Nama Lengkap", style: PSTypography.medium),
                const SizedBox(height: 6),
                Obx(
                  () => PSTextfield.input(
                    controller: controller.nameController,
                    readOnly: controller.state.value == RegisterState.loading,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Email", style: PSTypography.medium),
                const SizedBox(height: 6),
                Obx(
                  () => PSTextfield.input(
                    controller: controller.emailController,
                    readOnly: controller.state.value == RegisterState.loading,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Password", style: PSTypography.medium),
                const SizedBox(height: 6),
                Obx(
                  () => PSTextfield.input(
                    obscureText: true,
                    controller: controller.passwordController,
                    readOnly: controller.state.value == RegisterState.loading,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => PSButton.textOnly(
                    width: double.infinity,
                    text: "Daftar",
                    isLoading: controller.state.value == RegisterState.loading,
                    onTap: () async => await controller.register(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun? ",
                      style: PSTypography.regular,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "Masuk",
                        style: PSTypography.medium.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
