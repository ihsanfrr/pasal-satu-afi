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
        title: Text(
          "Forum Diskusi",
          style: PSTypography.semibold.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
