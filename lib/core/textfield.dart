import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String info;
  final TextEditingController controller;
  final bool isString;
  const TextFieldWidget(
      {super.key,
      required this.info,
      required this.controller,
      required this.isString});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.darkBlue),
      child: TextField(
        keyboardType:
            widget.isString ? TextInputType.text : TextInputType.number,
        controller: widget.controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.info,
          hintStyle: theme.bodyMedium,
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}
