import 'package:finance_app/colors.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class LittleNews extends StatefulWidget {
  final Image img;
  final String mainDescription;
  final String description;
  final String date;
  const LittleNews(
      {super.key,
      required this.img,
      required this.mainDescription,
      required this.description,
      required this.date});

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
        onTap: () {},
        child: Container(
          width: 358,
          height: 216,
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
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: widget.img,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.mainDescription,
                        style: theme.bodyLarge,
                      ),
                      Text(
                        widget.date,
                        style: theme.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
              Text(widget.description, style: theme.bodyMedium)
            ],
          ),
        ),
      ),
    );
  }
}
