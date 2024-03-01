import 'package:finance_app/colors.dart';
import 'package:finance_app/settings_buttons.dart';
import 'package:finance_app/strings.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme().textTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlue,
        elevation: 0,
        bottomOpacity: 0.0,
        title: Text(AppStrings.settings, style: theme.bodyLarge),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ReloadSumButton(),
            ),
            DefaultSettingsButton(
                text: "Поделиться с друзьями", picturePath: "assets/share.svg"),
            DefaultSettingsButton(
                text: "Политика конфеденциальности",
                picturePath: "assets/guard.svg"),
            DefaultSettingsButton(
                text: "Поделиться с друзьями",
                picturePath: "assets/document.svg")
          ],
        ),
      ),
    );
  }
}
