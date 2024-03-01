import 'package:finance_app/colors.dart';
import 'package:finance_app/little_news_widget.dart';
import 'package:finance_app/strings.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final theme = getTheme().textTheme;
  List<Widget> widgets = const [
    LittleNews(
        img: Image(
          image: AssetImage("assets/image_7.png"),
        ),
        mainDescription:
            "Внедрение новых\n технологий для\n обеспечения\n безопасности",
        description:
            "Внедрение новых технологий играет важную роль в обеспечении безопасности финансовых операций.",
        date: "5 Февраля, 2023"),
    LittleNews(
        img: Image(image: AssetImage("assets/image_2.png")),
        mainDescription: "mainDescription",
        description: "description",
        date: "date"),
    LittleNews(
        img: Image(image: AssetImage("assets/image_2.png")),
        mainDescription: "mainDescription",
        description: "description",
        date: "date"),
    LittleNews(
        img: Image(image: AssetImage("assets/image_2.png")),
        mainDescription: "mainDescription",
        description: "description",
        date: "date"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlue,
        elevation: 0,
        bottomOpacity: 0.0,
        title: Text(AppStrings.news, style: theme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widgets,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
