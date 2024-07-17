part of '../screens.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 40),
              FeaturedWidget(controller: controller),
              const SizedBox(height: 30),
              const BannerWidget(),
              const SizedBox(height: 20),
              const Text("Artikel Populer", style: PSTypography.semibold),
              const SizedBox(height: 10),
              ...List.generate(3, (index) => const ArticleWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.articleDetail),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                // color: PSColor.primary,
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: AssetImage("assets/images/bola.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 230,
                  child: Text(
                    "Belanda Melaju ke Semifinal Pertama dalam 2 Dasawarsa,Nyaris Tersandung di Jalur Paling Ringan",
                    style: PSTypography.semibold.copyWith(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Liputan 6",
                      style: PSTypography.regular.copyWith(
                        fontSize: 10,
                        color: PSColor.secondary,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "·",
                        style: PSTypography.bold.copyWith(
                          fontSize: 18,
                          color: PSColor.secondary.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Text(
                      "06 Juli 2024",
                      style: PSTypography.regular.copyWith(
                        fontSize: 10,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Kamu dapat hidup\ntanpa kebaikan,\ntetapi kamu tidak dapat hidup\ntanpa keadilan.",
            style: PSTypography.semibold.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          Image.asset(
            "assets/images/god_of_justice.png",
            width: 80,
          ),
        ],
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...List.generate(
          controller.featureNames.length,
          (i) => InkWell(
            onTap: () {
              switch (i) {
                case 0:
                  Get.toNamed(Routes.regulation);
                  break;
                case 1:
                  Get.toNamed(Routes.article);
                  break;
                case 2:
                  Get.toNamed(Routes.forum);
                  break;
                default:
              }
            },
            child: Container(
              width: (MediaQuery.of(context).size.width * 0.3) - 18,
              height: (MediaQuery.of(context).size.width * 0.3) - 18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/${controller.featureIcons[i]}",
                    width: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.featureNames[i],
                    style: PSTypography.medium.copyWith(fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Halo,",
              style: PSTypography.medium,
            ),
            Text(
              "Ihsan Fajar Ramadhan",
              style: PSTypography.semibold.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/pasal_satu.png",
          width: 45,
        )
      ],
    );
  }
}
