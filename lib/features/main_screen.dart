import 'package:finance_app/core/add_expenses.dart';
import 'package:finance_app/core/expenses_widget.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/app/info.dart';
import 'package:finance_app/core/buttons/split_buttons.dart';
import 'package:finance_app/res/strings.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 0 для расходов, 1 для доходов
  @override
  void initState() {
    super.initState();
    Money.loadData();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.32,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SignInOptionsScreen(),
          );
        },
      ),
    ).then((newExpense) {
      if (newExpense != null) {
        setState(() {
          if (_selectedIndex == 0) {
            Money.expenses.add(newExpense);
          } else {
            Money.income.add(newExpense);
          }
        });
      }
    });
  }

  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundBlue,
        title: Column(children: [
          const Text(
            'Общая сумма',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          ),
          Text(
            "${Money.getTotalSum()} ₽", // Обновляемый счетчик
            style: theme.titleLarge,
          )
        ]),
        actions: <Widget>[
          TextButton(
            onPressed: () => _showModalBottomSheet(context),
            child: Text(
              "Добавить",
              style: theme.titleMedium,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundBlue,
      body: Column(
        children: [
          SplitButton(onSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
          Expanded(
            child: _selectedIndex == 0
                ? ListView.builder(
                    itemCount: Money.expenses.length,
                    itemBuilder: (context, index) {
                      final expense = Money.expenses[index];
                      return ExpensesWidget(
                        mainDescription: expense.description,
                        description: expense.date,
                        sum: expense.sum.toString(),
                        date: expense.date,
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: Money.income.length,
                    itemBuilder: (context, index) {
                      final income = Money.income[index];
                      return ExpensesWidget(
                        mainDescription: income.description,
                        description: income.date,
                        sum: income.sum.toString(),
                        date: income.date,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
