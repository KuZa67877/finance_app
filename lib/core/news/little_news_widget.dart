import 'package:finance_app/core/news/big_news_widget.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class LittleNews extends StatefulWidget {
  final Image img;
  final String mainDescription;
  final String description;
  final String date;
  final String longDescription;
  const LittleNews(
      {super.key,
      required this.img,
      required this.mainDescription,
      required this.description,
      required this.date,
      required this.longDescription});

  @override
  State<LittleNews> createState() => _LittleNewsState();
}

class _LittleNewsState extends State<LittleNews> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BigNews(
                img: widget.img,
                mainDescription: widget.mainDescription,
                description: widget
                    .longDescription, // Пример использования текста из AppStrings
                date: widget.date,
              ),
            ),
          );
        },
        child: Container(
          // Удаление фиксированного размера для динамического изменения размера
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.darkBlue),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100,
                      height: 88,
                      child: ClipRRect(
                        child: widget.img,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.mainDescription,
                        style: theme.bodyLarge,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.date,
                        style: theme.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
              // Использование SingleChildScrollView для добавления прокрутки
              SingleChildScrollView(
                child: Text(widget.description,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
