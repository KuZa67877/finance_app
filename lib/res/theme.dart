import 'package:finance_app/colors.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() => ThemeData(
        textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.grey,
        fontSize: 24,
        fontWeight: FontWeight.w600, //для счета(суммарного) доходов расходов
      ),
      titleMedium: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500, //кнопка добавить в аппбаре
      ),
      bodyMedium: TextStyle(
        color: AppColors.deepGrey,
        fontSize: 16,
        fontWeight: FontWeight.w700, //для заголовка в вкладке с доходами
      ),
      bodySmall: TextStyle(
        color: AppColors.deepGrey, //для нижнего текста в вкладке с доходами
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.grey,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        color: AppColors.grey,
        fontSize: 24,
        fontWeight: FontWeight.w700, //для старта
      ),
      headlineLarge: TextStyle(
        color: AppColors.backgroundBlue,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ));
