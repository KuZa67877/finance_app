import 'package:finance_app/res/colors.dart';
import 'package:finance_app/core/news/little_news_widget.dart';
import 'package:finance_app/res/strings.dart';
import 'package:finance_app/res/theme.dart';
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
        longDescription: AppStrings.firstText,
        img: Image(
          image: AssetImage("assets/image_7.png"),
        ),
        mainDescription:
            "Внедрение новых\n технологий для\n обеспечения\n безопасности",
        description:
            "Внедрение новых технологий играет важную роль в обеспечении безопасности финансовых операций.",
        date: "5 Февраля, 2023"),
    LittleNews(
        longDescription: AppStrings.secondText,
        img: Image(image: AssetImage("assets/image_3.png")),
        mainDescription:
            "Партнерство с\nфинансовыми\nучреждениями для\nрасширения услуг.",
        description:
            "Партнерство с финансовыми учреждениями является важным стратегическим шагом для расширения спектра услуг компании и увеличения ее конкурентоспособности на рынке.",
        date: "5 Февраля, 2023"),
    LittleNews(
        longDescription: AppStrings.thirdText,
        img: Image(image: AssetImage("assets/image_5.png")),
        mainDescription:
            "Бонусная программа\nдля клиентов за\nиспользование\nонлайн-банкинга.",
        description:
            "Программа поощрения клиентов за использование онлайн-банкинга может предлагать различные преимущества, такие как отсутствие комиссий за определенные транзакции, более высокие процентные ставки по депозитам, скидки по кредитам или привилегии при использовании других финансовых инструментов, предлагаемых банком.",
        date: "5 Февраля, 2024"),
    LittleNews(
        longDescription: AppStrings.fouthText,
        img: Image(image: AssetImage("assets/image_4.png")),
        mainDescription: "Осуществление\nопераций с\nкриптовалютой.",
        description:
            "Внедрение операций с криптовалютой – это процесс интеграции возможности проведения финансовых операций с использованием криптовалюты в различные аспекты бизнеса и повседневной жизни.",
        date: "5 Февраля, 2024"),
    LittleNews(
        longDescription: AppStrings.fiveText,
        img: Image(image: AssetImage("assets/image_5.png")),
        mainDescription:
            "Бонусная программа\nдля клиентов за\nиспользование\nонлайн-банкинга.",
        description:
            "Программа поощрения клиентов за использование онлайн-банкинга может предлагать различные преимущества, такие как отсутствие комиссий за определенные транзакции, более высокие процентные ставки по депозитам, скидки по кредитам или привилегии при использовании других финансовых инструментов, предлагаемых банком.",
        date: "5 Февраля, 2024"),
    LittleNews(
        longDescription: AppStrings.sixText,
        img: Image(image: AssetImage("assets/image_6.png")),
        mainDescription:
            "Внедрение новых\nкредитных\nпродуктов для\nпредпринимателей.",
        description:
            "Внедрение новых кредитных продуктов для предпринимателей – стратегически важное решение для финансового учреждения, направленное на удовлетворение потребностей предпринимателей и стимулирование роста бизнеса.",
        date: "5 Февраля, 2024"),
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
