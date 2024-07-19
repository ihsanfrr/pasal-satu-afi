part of '../screens.dart';

class RegulationScreen extends GetView<RegulationController> {
  const RegulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Peraturan",
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "Peraturan Terbaru dan Penting di Indonesia",
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.search,
                color: PSColor.primary,
              ),
            ),
            onTap: () => Get.toNamed(Routes.regulationSearch),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          controller.regulationNames.length,
          (i) => RegulationCard(i: i, controller: controller),
        ),
      ),
    );
  }
}

class RegulationCard extends StatelessWidget {
  const RegulationCard({
    super.key,
    required this.i,
    required this.controller,
  });

  final int i;
  final RegulationController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.regulationList,
        arguments: controller.regulationNames[i].toLowerCase(),
      ),
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: EdgeInsets.only(
          top: 12,
          left: i.isEven ? 24 : 12,
          right: i.isOdd ? 24 : 12,
          bottom: 12,
        ),
        width: (MediaQuery.of(context).size.width / 2),
        height: (MediaQuery.of(context).size.width / 2),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/regulation_open.svg",
              width: 60,
            ),
            const SizedBox(height: 16),
            Text(
              controller.regulationNames[i],
              style: PSTypography.bold.copyWith(
                  fontSize: controller.regulationNames[i].length > 9 ? 14 : 16),
            ),
            const SizedBox(height: 2),
            Text(
              controller.regulationTexts[i],
              style: PSTypography.light.copyWith(
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
