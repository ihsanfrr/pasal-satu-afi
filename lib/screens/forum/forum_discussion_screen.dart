part of '../screens.dart';

class ForumDiscussionScreen extends GetView<ForumDiscussionController> {
  const ForumDiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.withOpacity(0.1),
        iconTheme: const IconThemeData(
          color: PSColor.primary,
        ),
        title: Text(
          controller.forum.title,
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.focusNode.unfocus(),
              child: NotificationListener(
                onNotification: (OverscrollIndicatorNotification notification) {
                  notification.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingDiscussionWidget(controller: controller),
                      const Divider(thickness: 1),
                      StreamBuilder(
                        stream: controller.forum.reference!
                            .collection("discussions")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const LoadingWidget();
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text("Error"),
                            );
                          } else if (snapshot.data == null) {
                            return const Center(
                              child: Text("No Data"),
                            );
                          }

                          QuerySnapshot<Map<String, dynamic>> data = snapshot
                              .data as QuerySnapshot<Map<String, dynamic>>;

                          List<DiscussionModel> discussions = data.docs
                              .map((e) => DiscussionModel.fromFirestore(e))
                              .toList();

                          controller.animateToBottom(isInitial: true);

                          return Column(
                            children: discussions
                                .map(
                                  (e) => DiscussionWidget(
                                    controller: controller,
                                    discussion: e,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomInputField(controller: controller)
        ],
      ),
    );
  }
}

class HeadingDiscussionWidget extends StatelessWidget {
  const HeadingDiscussionWidget({
    super.key,
    required this.controller,
  });

  final ForumDiscussionController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.forum.title,
            style: PSTypography.bold.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: PSColor.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.forum.user['fullName'],
                          style: PSTypography.semibold.copyWith(
                            fontSize: 14,
                            color: PSColor.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        if (controller.forum.user['uid'] ==
                            controller.app.user!.uid)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              color: PSColor.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "OP",
                              style: PSTypography.medium.copyWith(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd/MM/yyyy hh:ss a').format(
                            controller.forum.createdAt.toDate(),
                          ),
                          style: PSTypography.medium.copyWith(
                            fontSize: 10,
                            color: PSColor.secondary.withOpacity(0.8),
                          ),
                        )
                      ],
                    ),
                    Text(
                      controller.forum.description,
                      style: PSTypography.regular.copyWith(
                        fontSize: 14,
                        color: PSColor.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomInputField extends StatelessWidget {
  const BottomInputField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ForumDiscussionController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: const BoxConstraints(minHeight: 48),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E5EA),
            ),
          ),
        ),
        child: Stack(
          children: [
            TextField(
              focusNode: controller.focusNode,
              onChanged: controller.onFieldChanged,
              controller: controller.textController,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              cursorColor: PSColor.primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  right: 42,
                  left: 16,
                  top: 18,
                ),
                hintText: 'Masukkan tanggapan',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // custom suffix btn
            Positioned(
              bottom: 0,
              right: 0,
              child: GetBuilder<ForumDiscussionController>(builder: (_) {
                return IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: controller.sendDiscussionStatus ==
                          SendDiscussionStatus.loading
                      ? null
                      : controller.onFieldSubmitted,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscussionWidget extends StatelessWidget {
  const DiscussionWidget({
    super.key,
    required this.controller,
    required this.discussion,
  });

  final ForumDiscussionController controller;
  final DiscussionModel discussion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: PSColor.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              discussion.user['fullName'],
                              style: PSTypography.semibold.copyWith(
                                fontSize: 14,
                                color: PSColor.primary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (controller.forum.user['uid'] ==
                                controller.app.user!.uid)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: PSColor.primary,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "OP",
                                  style: PSTypography.medium.copyWith(
                                    fontSize: 11,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 4),
                            Text(
                              DateFormat('dd/MM/yyyy hh:ss a').format(
                                discussion.createdAt.toDate(),
                              ),
                              style: PSTypography.medium.copyWith(
                                fontSize: 10,
                                color: PSColor.secondary.withOpacity(0.8),
                              ),
                            )
                          ],
                        ),
                        Text(
                          discussion.content,
                          style: PSTypography.regular.copyWith(
                            fontSize: 14,
                            color: PSColor.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
