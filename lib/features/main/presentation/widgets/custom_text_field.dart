import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halalfood/core/formatter/number_formatter.dart';

class CustomTextField extends TextFormField {
  final Future<void> Function()? onTap;
  final Function(String)? onChanged;

  final String? Function(String?)? validatorF;

  CustomTextField(
      {Key? key,
      TextEditingController? controller,
      required InputDecoration decoration,
      TextStyle? textStyle,
      bool? numberInputType,
      bool? ageInputType,
      int? minLine,
      bool? obscureText,
      int? maxLine,
      void Function(String)? onFieldSubmitted,
      bool? clickable,
      this.onTap,
      this.onChanged,
      bool? readOnly,
      required BuildContext context,
      this.validatorF})
      : super(
          onTap: onTap,
          mouseCursor: clickable != null ? SystemMouseCursors.click : null,
          validator: validatorF,
          key: key,
          contextMenuBuilder: (context, state) {
            final List<ContextMenuButtonItem> buttonItems =
                state.contextMenuButtonItems;
            buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
              return buttonItem.type == ContextMenuButtonType.paste;
            });
            buttonItems.removeWhere((ContextMenuButtonItem buttonItem) {
              return buttonItem.type == ContextMenuButtonType.selectAll;
            });
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: state.contextMenuAnchors,
              buttonItems: buttonItems,
            );
          },
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText ?? false,
          keyboardType: numberInputType == true
              ? TextInputType.number
              : TextInputType.text,
          readOnly: readOnly ?? false,
          maxLines: maxLine ?? 1,
          inputFormatters: numberInputType == true
              ? <TextInputFormatter>[
                  CustomFormatter(sample: 'xx-xxx-xx-xx', separator: '-'),
                  FilteringTextInputFormatter.allow(
                    RegExp("[0-9.-]+"),
                  ),
                ]
              : ageInputType == true &&
                      (numberInputType == null || numberInputType == false)
                  ? <TextInputFormatter>[
                      CustomFormatter(sample: 'xx.xx.xxxx', separator: '.'),
                      FilteringTextInputFormatter.allow(
                        RegExp("[0-9.]+"),
                      ),
                    ]
                  : [],
          decoration: decoration,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          onChanged: onChanged,
        );
}
