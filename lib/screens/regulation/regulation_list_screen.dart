part of '../screens.dart';

class RegulationListScreen extends GetView<RegulationListController> {
  const RegulationListScreen({super.key});

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
        title: Text(
          "UU",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              10,
              (_) => const RegulationListWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class RegulationListWidget extends StatelessWidget {
  const RegulationListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.regulationDetail),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        margin: const EdgeInsets.only(bottom: 16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                TagWidget(tag: "Undang-Undang"),
                TagWidget(tag: "2024"),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "Provinsi Daerah Khusus Jakarta",
              style: PSTypography.medium.copyWith(
                fontSize: 14,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Text(
              "Undang-Undang Nomor 2 Tahun 2024",
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: PSColor.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          tag,
          style:
              PSTypography.regular.copyWith(color: Colors.white, fontSize: 8),
        ),
      ),
    );
  }
}
