part of 'widgets.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({
    super.key,
    this.margin,
    required this.conversation,
  });

  final EdgeInsetsGeometry? margin;
  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignmentOnType,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (conversation.sender == 'ai')
          const CircleAvatar(
            backgroundColor: PSColor.primary,
          ),
        Container(
          margin: margin ?? EdgeInsets.zero,
          child: PhysicalShape(
            clipper: clipperOnType,
            elevation: 2,
            color: bgColorOnType,
            shadowColor: Colors.grey.shade200,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              padding: paddingOnType,
              child: Column(
                crossAxisAlignment: crossAlignmentOnType,
                children: [
                  Text(
                    conversation.text,
                    style: TextStyle(color: textColorOnType),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateFormat('hh:mm a').format(
                      conversation.createdAt.toDate(),
                    ),
                    style: TextStyle(color: textColorOnType, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color get textColorOnType {
    if (conversation.sender == 'ai') {
      return PSColor.primary;
    } else {
      return Colors.white;
    }
  }

  Color get bgColorOnType {
    if (conversation.sender == 'ai') {
      return const Color(0xFFE7E7ED);
    } else {
      return PSColor.primary;
    }
  }

  CustomClipper<Path> get clipperOnType {
    if (conversation.sender == 'ai') {
      return ChatBubbleClipper1(type: BubbleType.receiverBubble);
    } else {
      return ChatBubbleClipper1(type: BubbleType.sendBubble);
    }
  }

  CrossAxisAlignment get crossAlignmentOnType {
    if (conversation.sender == 'ai') {
      return CrossAxisAlignment.start;
    } else {
      return CrossAxisAlignment.end;
    }
  }

  MainAxisAlignment get alignmentOnType {
    if (conversation.sender == 'ai') {
      return MainAxisAlignment.start;
    } else {
      return MainAxisAlignment.end;
    }
  }

  EdgeInsets get paddingOnType {
    if (conversation.sender == 'ai') {
      return const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 24,
        right: 10,
      );
    } else {
      return const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24);
    }
  }
}
