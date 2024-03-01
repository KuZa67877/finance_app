import 'package:finance_app/colors.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String info;
  const TextFieldWidget({super.key, required this.info});

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
        textAlign:
            TextAlign.center, // Выравнивание текста по центру горизонтально
        textAlignVertical: TextAlignVertical
            .center, // Выравнивание текста по центру вертикально
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
