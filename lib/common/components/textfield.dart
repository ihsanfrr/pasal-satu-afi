part of 'components.dart';

class PSTextfield {
  static Widget input({
    EdgeInsetsGeometry? margin,
    TextEditingController? controller,
    FocusNode? focusNode,
    double? width,
    double? height,
    bool? autofocus,
    TextStyle? style,
    TextStyle? hintStyle,
    bool? readOnly,
    bool? enabled,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool? obscureText,
    TextAlign? textAlign,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    Function(String)? onSubmitted,
    List<TextInputFormatter>? inputFormatters,
    int? minLines,
    int? maxLines,
    int? maxLength,
    Function()? onTap,
    Widget? prefixIcon,
    String? hintText,
    Widget? suffixIcon,
    InputBorder? focusedBorder,
    InputBorder? border,
    InputBorder? enabledBorder,
  }) =>
      Container(
        width: width,
        height: maxLines != null ? null : height ??= 50,
        margin: margin,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus ??= false,
          style: style,
          readOnly: readOnly ??= false,
          enabled: enabled,
          cursorColor: PSColor.primary,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText ??= false,
          textAlign: textAlign ??= TextAlign.start,
          minLines: minLines ??= 1,
          maxLines: maxLines ??= 1,
          maxLength: maxLength,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          onTap: onTap,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
            focusedBorder: focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: PSColor.primary,
                  ),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
          ),
        ),
      );
}
