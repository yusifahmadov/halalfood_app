import 'package:flutter/material.dart';
import 'package:halalfood/core/constant/constants.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final bool maxSize;
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      this.width,
      this.maxSize = false,
      this.color = appMainColor,
      this.textStyle,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxSize == true ? double.infinity : width,
      child: MaterialButton(
        minWidth: 100,
        highlightElevation: 0,
        disabledElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        highlightColor: Colors.transparent,
        splashColor: Colors.black54,
        onPressed: onPressed,
        color: color,
        elevation: 0,
        padding: const EdgeInsets.all(12),
        hoverElevation: 0,
        focusElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
          child: Text(
            text,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
