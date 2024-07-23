part of '../screens.dart';

class RegulationSearchScreen extends GetView<RegulationSearchController> {
  const RegulationSearchScreen({super.key});

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
        title: TextField(
          controller: controller.searchController,
          style: PSTypography.regular.copyWith(
            color: PSColor.primary,
          ),
          decoration: InputDecoration(
            hintText: "Cari peraturan lainnya....",
            hintStyle: PSTypography.regular.copyWith(
              color: PSColor.secondary,
            ),
            border: InputBorder.none,
          ),
          cursorColor: PSColor.primary,
          onSubmitted: (val) {
            controller.searchRegulation();
          },
          autofocus: true,
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.close,
                color: PSColor.primary,
              ),
            ),
            onTap: () {
              controller.searchController.clear();
              controller.regulations.clear();
              controller.state = RegulationSearchState.initial;
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: GetBuilder<RegulationSearchController>(
          builder: (_) => controller.state == RegulationSearchState.loading
              ? const LoadingWidget()
              : controller.regulations.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/regulation.svg"),
                          const SizedBox(height: 10),
                          controller.state == RegulationSearchState.initial
                              ? const Text("Belum ada data")
                              : const Text("Peraturan tidak ditemukan"),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.regulations.length,
                      itemBuilder: (context, i) {
                        final regulation = controller.regulations[i];
                        return RegulationListWidget(regulation: regulation);
                      },
                    ),
        ),
      ),
    );
  }
}
