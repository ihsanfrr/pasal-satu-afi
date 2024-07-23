part of '../screens.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 30),
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: PSColor.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Obx(
                    () {
                      return Text(
                        controller.name.value!,
                        style: PSTypography.bold.copyWith(
                          fontSize: 22,
                        ),
                      );
                    },
                  ),
                  Text(
                    controller.app.user!.email!,
                    style: PSTypography.medium.copyWith(
                      fontSize: 14,
                      color: PSColor.secondary,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ProfileMenuWidget(
                          name: "Informasi Akun",
                          onTap: () async {
                            var result = await Get.toNamed(Routes.accountInfo);
                            if (result != null) {
                              controller.name.value = result as String;
                            }
                          },
                        ),
                        const Divider(thickness: 1),
                        ProfileMenuWidget(
                          name: "Pengaturan",
                          onTap: () => Get.toNamed(Routes.setting),
                        ),
                        const Divider(thickness: 1),
                        ProfileMenuWidget(
                          name: "Kebijakan Privasi",
                          onTap: () => Get.toNamed(Routes.privacyPolicy),
                        ),
                        const Divider(thickness: 1),
                        ProfileMenuWidget(
                          name: "Tentang Pengembang",
                          onTap: () => Get.toNamed(Routes.aboutDeveloper),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 60,
              right: 0,
              child: GestureDetector(
                onTap: () => controller.signOut(),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: PSColor.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Keluar",
                      style: PSTypography.medium.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.name,
    this.onTap,
  });

  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: PSTypography.medium.copyWith(fontSize: 14),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              weight: 5,
            ),
          ],
        ),
      ),
    );
  }
}
