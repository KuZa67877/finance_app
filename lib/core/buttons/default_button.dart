import 'package:finance_app/colors.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  const DefaultButton({super.key, required this.text});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Container(
          width: 358,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: AppColors.grey),
          child: Center(
              child: Text(
            widget.text,
            style: theme.headlineLarge,
          )),
        ));
  }
}
