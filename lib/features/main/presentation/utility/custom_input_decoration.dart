import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:halalfood/core/constant/constants.dart';
import 'package:halalfood/features/user/presentation/utility/border_radius.dart';

typedef FutureCallBack = Future<void> Function();

class CustomInputDecoration extends InputDecoration {
  CustomInputDecoration(
      {required context,
      required hintText,
      bool? clearButton,
      Color? iconColor,
      bool? obscured,
      Color? fillColor,
      bool? obscureChecker,
      FutureCallBack? onTap,
      FutureCallBack? onObscureChange,
      TextStyle? hintStyle,
      String? prefixText,
      String? suffixText,
      String? prefixIcon,
      String? suffixIcon,
      void Function()? suffixIconOnTap,
      bool? isSearchField})
      : super(
            hintStyle: hintStyle ??
                Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15, color: Colors.grey),
            hintText: hintText,
            isDense: true,
            fillColor: textFieldColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: CustomBorderRadius.radius8(),
                borderSide: const BorderSide(
                    width: 0.2,
                    style: BorderStyle.solid,
                    color: Colors.grey,
                    strokeAlign: 0.5)),
            disabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: CustomBorderRadius.radius8(),
                borderSide: const BorderSide(
                    color: appMainColor, width: 0.5, strokeAlign: 1)),
            border: OutlineInputBorder(
                borderRadius: CustomBorderRadius.radius8(),
                borderSide: const BorderSide(
                    width: 0.5,
                    style: BorderStyle.none,
                    color: Colors.grey,
                    strokeAlign: 0.5)),
            contentPadding: clearButton != null ||
                    (isSearchField != false && isSearchField != null)
                ? null
                : obscureChecker == true
                    ? const EdgeInsets.fromLTRB(10, 20, 0, 0)
                    : null,
            errorMaxLines: 6,
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            hoverColor: Colors.transparent,
            suffixText: suffixText,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: CustomBorderRadius.radius8(),
                borderSide: const BorderSide(
                    color: redColor, width: 1, strokeAlign: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: CustomBorderRadius.radius8(),
                borderSide: const BorderSide(
                    color: redColor, width: 0.5, strokeAlign: 1)),
            suffixStyle:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
            suffixIcon: clearButton != false && clearButton != null
                ? GestureDetector(
                    onTap: onTap,
                    child: const Icon(
                      Icons.clear,
                      size: 20,
                    ),
                  )
                : obscureChecker == true
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        highlightColor: Colors.transparent,
                        onPressed: onObscureChange,
                        icon: Icon(
                          obscured == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                    : isSearchField == true
                        ? const Icon(
                            Icons.search,
                            size: 25,
                          )
                        : suffixIcon != null
                            ? Padding(
                                padding: const EdgeInsets.all(12),
                                child: GestureDetector(
                                  onTap: suffixIconOnTap,
                                  child: SvgPicture.asset(
                                    "assets/icons/$suffixIcon.svg",
                                    height: 20,
                                    width: 25,
                                    colorFilter: ColorFilter.mode(
                                        iconColor ?? Colors.black,
                                        BlendMode.color),
                                    fit: BoxFit.fill,
                                  ),
                                ))
                            : null,
            prefixIcon: prefixText != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" $prefixText"),
                    ],
                  )
                : prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          "assets/icons/$prefixIcon.svg",
                          height: 20,
                          width: 25,
                          colorFilter: ColorFilter.mode(
                              iconColor ?? Colors.black, BlendMode.color),
                          fit: BoxFit.fill,
                        ))
                    : null);
}
