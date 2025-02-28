import 'package:amazon/core/themes/colors.dart';
import 'package:amazon/core/utils/size_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextButton extends StatefulWidget {
  final Function? buttonFunction;
  final String? buttonText;
  final bool online;
  final bool isIcon;
  final String? iconAsset;
  final Color? buttonOnlineColor, onlineTextColor;

  const CustomTextButton(
      {super.key,
      required this.buttonFunction,
      this.buttonText,
      this.online = true,
      this.buttonOnlineColor,
      this.onlineTextColor,
      this.isIcon = false,
      this.iconAsset});

  @override
  _CustomTextButtonState createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: widget.online
              ? widget.buttonFunction != null
                  ? () {
                      HapticFeedback.lightImpact();
                      widget.buttonFunction!();
                    }
                  : () {
                      HapticFeedback.lightImpact();
                    }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(20)),
            child: widget.isIcon
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SvgPicture.asset(
                      //   widget.iconAsset ?? '',
                      //   color: (widget.onlineTextColor ?? Colors.white),
                      // ),
                      SizedBox(width: sizer(true, 14, context)),
                      Text(widget.buttonText ?? '',
                          style: TextStyle(
                              color: widget.online
                                  ? (widget.onlineTextColor ?? Colors.white)
                                  : AppColors.blackColor,
                              fontSize: sizer(true, 13, context),
                              fontWeight: FontWeight.w700))
                    ],
                  )
                : Center(
                    child: Text(widget.buttonText ?? '',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: sizer(true, 13.6, context),
                            fontWeight: FontWeight.w400))),
          ),
        ));
  }
}
