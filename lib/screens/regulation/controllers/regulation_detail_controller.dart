part of '../../screens.dart';

class RegulationDetailController extends GetxController {
  late RegulationModel regulation;

  @override
  void onInit() {
    super.onInit();
    regulation = Get.arguments as RegulationModel;
  }
}
