part of '../screens.dart';

class ArticleScreen extends GetView<ArticleDetailController> {
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
        title: Text(
          "Artikel",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: List.generate(
              10,
              (_) => const ArticleWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
