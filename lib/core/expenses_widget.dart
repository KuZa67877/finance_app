import 'package:finance_app/app/info.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class ExpensesWidget extends StatelessWidget {
  final String mainDescription;
  final String description;
  final String sum;
  final String date;
  ExpensesWidget(
      {super.key,
      required this.mainDescription,
      required this.description,
      required this.sum,
      required this.date});
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Container(
        width: 358,
        height: 72,
        decoration: BoxDecoration(
            color: AppColors.darkBlue, borderRadius: BorderRadius.circular(8)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Column(
              children: [
                Text(
                  mainDescription,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey),
                ),
                Text(
                  description,
                  style: theme.bodySmall,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 16),
            child: Column(
              children: [
                Text(
                  sum.startsWith("-")
                      ? "$sum ₽"
                      : "$sum ₽", // Добавляем знак минуса перед суммой, если она отрицательная
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.grey),
                ),
                Text(
                  //date.substring(0, 10),
                  formatDateString(date.substring(0, 10)),
                  style: theme.bodySmall,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
