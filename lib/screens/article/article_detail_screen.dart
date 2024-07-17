part of '../screens.dart';

class ArticleDetailScreen extends GetView<ArticleDetailController> {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImageAndTitleWidget(),
            Container(
              padding: const EdgeInsets.all(24),
              child: const Text("Lorem ipsum dolor sit amet as picing."),
            )
          ],
        ),
      ),
    );
  }
}

class ImageAndTitleWidget extends StatelessWidget {
  const ImageAndTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/bola.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              PSColor.primary.withOpacity(0.7),
              PSColor.primary.withOpacity(0.1),
            ],
            stops: const [0.1, 0.4],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Belanda Melaju ke Semifinal Pertama dalam 2 Dasawarsa, Nyaris Tersandung di Jalur Paling Ringan",
                  style: PSTypography.semibold.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "Liputan 6",
                      style: PSTypography.regular.copyWith(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "·",
                        style: PSTypography.bold.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "06 Juli 2024",
                      style: PSTypography.regular.copyWith(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
