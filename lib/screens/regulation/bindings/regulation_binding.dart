part of '../../screens.dart';

class RegulationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegulationController());
  }
}
