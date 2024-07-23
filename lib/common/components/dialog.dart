part of './components.dart';

class PSDialog {
  static dynamic success(String message) {
    Get.snackbar(
      "Berhasil!",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    );
  }

  static dynamic error(String message) {
    Get.snackbar(
      "Terjadi Kesalahan!",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    );
  }
}
