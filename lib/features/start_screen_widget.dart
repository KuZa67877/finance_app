import 'package:finance_app/res/colors.dart';
import 'package:finance_app/core/buttons/default_button.dart';
import 'package:finance_app/res/strings.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 72),
                child:
                    Image(image: AssetImage('assets/start_screen_image.png')),
              ),
              Text(AppStrings.start, style: theme.bodyLarge, maxLines: 2),
              Text(
                AppStrings.startDescription,
                style: theme.bodyMedium,
                maxLines: 3,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 96),
                child: DefaultButton(
                  text: "Начать",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Условия пользования/\nполитика конфеденциальности",
                    style: theme.bodyMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundBlue,
    );
  }
}
