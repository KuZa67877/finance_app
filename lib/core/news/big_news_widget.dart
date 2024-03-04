import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/strings.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(
              context), // Закрытие текущего экрана и возврат на предыдущий
        ),
        title: Text(AppStrings.news, style: theme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.darkBlue),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.description,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.grey),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
