part of '../screens.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/pasal_satu.png",
                width: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PasalSatu",
                    style: PSTypography.bold.copyWith(
                      fontSize: 24,
                      color: PSColor.secondary,
                    ),
                  ),
                  Text(
                    "Law in Our Hands",
                    style: PSTypography.light.copyWith(
                      fontSize: 12,
                      color: PSColor.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Center(
              child: Obx(
                () => Text(
                  controller.selectedText.value,
                  style: PSTypography.light.copyWith(
                    fontSize: 12,
                    color: PSColor.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
