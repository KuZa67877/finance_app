import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class BigNews extends StatefulWidget {
  final Image img;
  final String mainDescription;
  final String description;
  final String date;
  const BigNews(
      {super.key,
      required this.img,
      required this.mainDescription,
      required this.description,
      required this.date});

  @override
  State<BigNews> createState() => _BigNewsState();
}

class _BigNewsState extends State<BigNews> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            width: 358,
            child: Column(children: [
              Text(
                widget.mainDescription,
                style: theme.bodyLarge,
              ),
              Text(widget.date, style: theme.bodyMedium),
              Container(
                width: 326,
                height: 232.21,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: widget.img,
              ),
              Text(widget.description)
            ]),
          ),
        ),
      ),
    );
  }
}
