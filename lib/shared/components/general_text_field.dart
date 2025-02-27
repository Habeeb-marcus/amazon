import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final double? fontSize;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool multiline;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  const GeneralTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType,
    this.textController,
    this.textCapitalization,
    this.onSaved,
    this.fontSize,
    this.validator,
    this.textAlignVertical,
    this.strutStyle,
    this.autoValidateMode,
    this.multiline = false,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return SizedBox(
      height: sizer(false, 30, context),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.yellow, // Background color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50), // Shadow color
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          focusNode: focusNode,
          maxLength: maxLength,

          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: textController ?? controller,
          onSaved: onSaved,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center, // textAlignVertical,
          autovalidateMode: autoValidateMode,
          maxLines: multiline ? 3 : 1,
          minLines: multiline ? 3 : 1,
          cursorHeight: sizer(true, 20.0, context),
          keyboardType: keyboardType ?? TextInputType.text,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: fontSize ?? sizer(true, 13, context)),
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.secondaryRedColor,
              ),
            ),
            counter: const Offstage(),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0.5,
                color: AppColors.secondaryRedColor,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: multiline
                    ? sizer(false, 8, context)
                    : sizer(false, 10, context),
                horizontal: sizer(true, 20, context)),
            fillColor: AppColors.white,
            hintText: hintText ?? '',
            hintStyle: TextStyle(
                color: AppColors.blackColor,
                fontSize: fontSize ?? sizer(true, 13, context)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sizer(true, 5, context)),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.amber,
              ),
            ),
            errorStyle: TextStyle(fontSize: sizer(true, 12, context)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sizer(true, 5, context)),
              borderSide: BorderSide(
                width: 1, color: Colors.grey,
                //  style: BorderStyle.none,
              ),
            ),
            filled: true,
          ),

          //autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator ??
              (val) {
                if ((val?.length ?? 0) == 0) {
                  return "${hintText ?? "Field"} is required";
                } else {
                  return null;
                }
              },
        ),
      ),
    );
  }
}
