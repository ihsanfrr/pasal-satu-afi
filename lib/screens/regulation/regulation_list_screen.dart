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
          controller.regulation.toUpperCase(),
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: GetBuilder<RegulationListController>(
            builder: (controller) {
              if (controller.state == RegulationState.initial ||
                  controller.state == RegulationState.loading) {
                return const LoadingWidget();
              } else if (controller.state == RegulationState.loaded) {
                return Column(
                  children: [
                    ...controller.regulations
                        .map((e) => RegulationListWidget(regulation: e))
                        .toList(),
                    PSButton.textOnly(
                      width: double.infinity,
                      text: "Muat lebih banyak",
                      isLoading: controller.state == RegulationState.loading,
                      onTap: () {
                        controller.page++;
                        controller.getWebsiteData();
                      },
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Tidak ada data!"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class RegulationListWidget extends StatelessWidget {
  const RegulationListWidget({
    super.key,
    required this.regulation,
  });

  final RegulationModel regulation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.regulationDetail, arguments: regulation),
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
            Row(
              children: [
                TagWidget(tag: regulation.regulation),
                TagWidget(tag: regulation.year),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TagWidget(tag: regulation.initiator),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              regulation.title
                  .replaceAll('<mark>', '')
                  .replaceAll('</mark>', ''),
              style: PSTypography.medium.copyWith(
                fontSize: 14,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 2),
            Text(
              regulation.document,
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            ),
            if (regulation.tags != '')
              Column(
                children: [
                  const SizedBox(height: 2),
                  Text(
                    'Tags: ${regulation.tags}'
                        .replaceAll('&amp', '')
                        .replaceAll(';', ''),
                    style: PSTypography.light.copyWith(
                      fontSize: 10,
                      color: Colors.blue,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
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
      child: Text(
        tag,
        style: PSTypography.regular.copyWith(color: Colors.white, fontSize: 8),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
