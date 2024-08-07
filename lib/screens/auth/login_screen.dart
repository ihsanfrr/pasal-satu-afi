part of '../screens.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                  "Ayo Masuk",
                  style: PSTypography.bold.copyWith(
                    fontSize: 36,
                    color: PSColor.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Jangan Biarkan Ketidakadilan Menimpa Anda.\nLawan dengan Pasal Satu.",
                  style: PSTypography.regular.copyWith(
                    fontSize: 12,
                    color: PSColor.secondary,
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Email", style: PSTypography.medium),
                const SizedBox(height: 6),
                Obx(
                  () => PSTextfield.input(
                    controller: controller.emailController,
                    readOnly: controller.state.value == LoginState.loading,
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
                    readOnly: controller.state.value == LoginState.loading,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => PSButton.textOnly(
                    width: double.infinity,
                    text: "Masuk",
                    isLoading: controller.state.value == LoginState.loading,
                    onTap: () async => await controller.login(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum punya akun? ",
                      style: PSTypography.regular,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.register);
                      },
                      child: Text(
                        "Daftar",
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
