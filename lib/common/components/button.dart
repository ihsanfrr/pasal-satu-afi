part of 'components.dart';

class PSButton {
  static Widget textOnly({
    EdgeInsetsGeometry? margin,
    required double width,
    double? height,
    required String text,
    required Function()? onTap,
    Color? color,
    Color? colorText,
    bool? outline,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin,
          width: width,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: outline != null && outline
                ? Colors.white
                : color ?? PSColor.primary,
            border: outline != null && outline
                ? Border.all(width: 1.5, color: color ?? PSColor.primary)
                : null,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              text,
              style: PSTypography.light.copyWith(
                fontWeight: FontWeight.w500,
                color: colorText ?? Colors.white,
              ),
            ),
          ),
        ),
      );

  static Widget iconOnly({
    required double width,
    required Icon icon,
    required Function()? onTap,
    bool? outline,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: outline != null && outline ? Colors.white : PSColor.primary,
            border: outline != null && outline
                ? Border.all(width: 1.5, color: PSColor.primary)
                : null,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(child: icon),
        ),
      );

  static Widget textWithIcon({
    required double width,
    required String text,
    required Icon icon,
    Color? textColor,
    required Function()? onTap,
    bool? outline,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: outline != null && outline ? Colors.white : PSColor.primary,
            border: outline != null && outline
                ? Border.all(width: 1.5, color: PSColor.primary)
                : null,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                text,
                style: PSTypography.medium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      );
}
