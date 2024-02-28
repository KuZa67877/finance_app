import 'package:finance_app/colors.dart';
import 'package:finance_app/theme.dart';
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
    return Container(
      width: 358,
      height: 72,
      decoration: BoxDecoration(
          color: AppColors.darkBlue, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Column(
          children: [
            Text(
              mainDescription,
              style: theme.bodyMedium,
            ),
            Text(
              description,
              style: theme.bodySmall,
            )
          ],
        ),
        Column(
          children: [
            Text(
              sum,
              style: theme.bodyMedium,
            ),
            Text(
              date,
              style: theme.bodySmall,
            )
          ],
        )
      ]),
    );
  }
}
