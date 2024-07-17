part of '../screens.dart';

class HomeWrapperScreen extends GetView<HomeWrapperController> {
  const HomeWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.pages[controller.currentIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PSColor.primary,
        onPressed: () => Get.toNamed(Routes.chatAI),
        child: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: PSColor.primary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  controller.changeIndex(0);
                },
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        color: controller.currentIndex == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                      ),
                      Text(
                        "Home",
                        style: PSTypography.medium.copyWith(
                          color: controller.currentIndex == 0
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  controller.changeIndex(1);
                },
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person,
                        color: controller.currentIndex == 1
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                      ),
                      Text(
                        "Profile",
                        style: PSTypography.medium.copyWith(
                          color: controller.currentIndex == 1
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
