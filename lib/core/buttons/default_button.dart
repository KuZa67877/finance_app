import 'package:finance_app/app/navigation_bar.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
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
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyNavigationBar()),
          );
        },
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

class DefaultCreditButton extends StatefulWidget {
  final String text;
  final void Function;
  const DefaultCreditButton(
      {super.key, required this.text, required this.Function});

  @override
  State<DefaultCreditButton> createState() => _DefaultCreditButtonState();
}

class _DefaultCreditButtonState extends State<DefaultCreditButton> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => widget.Function,
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
