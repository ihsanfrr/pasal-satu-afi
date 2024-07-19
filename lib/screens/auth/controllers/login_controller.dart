part of '../../screens.dart';

enum LoginState { initial, loading }

class LoginController extends GetxController {
  AppController app = Get.find<AppController>();

  Rx<LoginState> state = LoginState.initial.obs;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    state.close();
    super.onClose();
  }

  Future login() async {
    state.value = LoginState.loading;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      PSDialog.error('Silakan masukkan alamat email Anda.');
      return;
    }

    if (password.isEmpty) {
      PSDialog.error('Silakan masukkan kata sandi.');
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      app.checkAuth();
    } on FirebaseAuthException catch (e) {
      state.value = LoginState.initial;
      if (e.code == 'user-not-found') {
        PSDialog.error('Pengguna tidak ditemukan.');
      } else if (e.code == 'wrong-password') {
        PSDialog.error('Kata sandi salah.');
      } else {
        PSDialog.error('Terjadi kesalahan yang tidak terduga: ${e.toString()}');
      }
    } catch (e) {
      state.value = LoginState.initial;
      PSDialog.error('Terjadi kesalahan yang tidak terduga: ${e.toString()}');
    }
  }
}
