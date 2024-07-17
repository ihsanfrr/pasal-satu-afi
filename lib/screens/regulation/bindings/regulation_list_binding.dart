part of '../../screens.dart';

class RegulationListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegulationListController());
  }
}
