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
                PSTextfield.input(),
                const SizedBox(height: 10),
                const Text("Password", style: PSTypography.medium),
                const SizedBox(height: 6),
                PSTextfield.input(obscureText: true),
                const SizedBox(height: 20),
                PSButton.textOnly(
                  width: double.infinity,
                  text: "Masuk",
                  onTap: () {
                    Get.toNamed(Routes.home);
                  },
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
