part of '../../screens.dart';

enum RegisterState { initial, loading }

class RegisterController extends GetxController {
  AppController app = Get.find<AppController>();

  Rx<RegisterState> state = RegisterState.initial.obs;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    state.close();
    super.onClose();
  }

  Future register() async {
    state.value = RegisterState.loading;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty) {
      PSDialog.error('Silahkan masukan nama anda.');
      return;
    }

    if (email.isEmpty) {
      PSDialog.error('Silakan masukkan alamat email Anda.');
      return;
    }

    if (password.isEmpty) {
      PSDialog.error('Silakan masukkan kata sandi.');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      credential.user!.updateDisplayName(name);

      final userRef = FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid);

      await userRef.set({
        'fullName': name,
        'email': email,
        'photoUrl': '',
        'role': 'user',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': null,
      });

      app.checkAuth();
    } on FirebaseAuthException catch (e) {
      String message = '';
      switch (e.code) {
        case 'weak-password':
          message = 'Kata sandi yang diberikan terlalu lemah.';
          break;
        case 'email-already-in-use':
          message = 'Akun sudah ada untuk email itu.';
          break;
        default:
          message = 'Terjadi kesalahan saat pendaftaran. Silakan coba lagi.';
      }

      state.value = RegisterState.initial;
      PSDialog.error(message);
    } catch (e) {
      state.value = RegisterState.initial;
      PSDialog.error('Terjadi kesalahan yang tidak terduga: ${e.toString()}');
    }
  }
}
