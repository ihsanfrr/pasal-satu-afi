part of '../screens.dart';

class ForumScreen extends GetView<ForumController> {
  const ForumScreen({super.key});

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
              "Forum Diskusi",
              style: PSTypography.semibold.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              "Diskusi terbaru untuk kamu",
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
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: StreamBuilder(
            stream: ForumDatabase().streamForums(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ArticleShimmer();
              }

              return Column(
                children: List.generate(
                  snapshot.data!.docs.length,
                  (i) => DiscussionCardWidget(
                    forum: ForumModel.fromFirestore(snapshot.data!.docs[i]),
                  ),
                ),
              );
            },
          ),
          // child: GetBuilder<ForumController>(
          //   builder: (_) {
          //     if (controller.forums == null) {
          //       return const ArticleShimmer();
          //     } else {
          //       return Column(
          //         children: List.generate(
          //           controller.forums!.length,
          //           (i) => DiscussionCardWidget(forum: controller.forums![i]),
          //         ),
          //       );
          //     }
          //   },
          // ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.toNamed(Routes.forumEdit);
        },
        backgroundColor: PSColor.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DiscussionCardWidget extends StatelessWidget {
  const DiscussionCardWidget({
    super.key,
    required this.forum,
  });

  final ForumModel forum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.forumDiscussion, arguments: forum),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  forum.user['fullName'] ?? "Anonim",
                  style: PSTypography.semibold.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 8),
                Text(
                  timeAgoSinceDate(forum.createdAt.toDate().toString()),
                  style: PSTypography.light.copyWith(
                    fontSize: 11,
                    color: PSColor.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              forum.title,
              style: PSTypography.semibold,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            Text(
              forum.description,
              style: PSTypography.regular.copyWith(
                fontSize: 12,
                color: PSColor.secondary,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.chat_bubble,
                  size: 18,
                ),
                const SizedBox(width: 4),
                StreamBuilder<QuerySnapshot>(
                  stream:
                      forum.reference!.collection("discussions").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("-");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("-");
                    }

                    return Text(
                      snapshot.data!.size.toString(),
                      style: PSTypography.medium.copyWith(
                        fontSize: 14,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CreateForumWidget extends StatelessWidget {
  const CreateForumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PSTextfield.input(
                      autofocus: true,
                      hintText: "Judul diskusi",
                      hintStyle: PSTypography.semibold,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    PSTextfield.input(
                      hintText: "Masukkan pesan...",
                      style: PSTypography.light,
                      maxLines: 5,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: PSColor.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
          Expanded(
            child: PSButton.textOnly(
              width: 0,
              text: "Kirim",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class SearchForumWidget extends StatelessWidget {
  const SearchForumWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PSTextfield.input(
              height: 50,
              hintText: "Cari diskusi....",
              hintStyle: PSTypography.light.copyWith(
                fontSize: 14,
                color: PSColor.secondary,
              ),
              style: PSTypography.medium.copyWith(
                fontSize: 14,
                color: PSColor.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          PSButton.textOnly(
            width: 100,
            text: "Diskusi Baru",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
