part of '../screens.dart';

class ArticleScreen extends GetView<ArticleController> {
  const ArticleScreen({super.key});

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
              "Artikel",
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "Informasi Terkini dan Analisis Hukum",
              style: PSTypography.light.copyWith(
                fontSize: 10,
                color: PSColor.secondary,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: GetBuilder<ArticleController>(
            builder: (_) {
              if (controller.articles == null) {
                return const ArticleShimmer();
              } else {
                return Column(
                  children: List.generate(
                    controller.articles!.length,
                    (i) => ArticleWidget(article: controller.articles![i]),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
