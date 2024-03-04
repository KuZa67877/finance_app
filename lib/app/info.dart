import 'package:finance_app/app/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expenses {
  final int sum;
  final String theme;
  final String description;
  final DateTime dateTime;
  Expenses({
    required this.sum,
    required this.theme,
    required this.description,
    required this.dateTime,
  });

  @override
  String toString() {
    return '$sum|$theme|$description|${dateTime.toIso8601String()}'; // Сохраняем в формате ISO 8601
  }

  static Expenses fromString(String expenseString) {
    final parts = expenseString.split('|');
    return Expenses(
      sum: int.parse(parts[0]),
      theme: parts[1].toString(),
      description: parts[2],
      dateTime: DateTime.parse(convertDateFormat(parts[3])),
    );
  }
}

String convertDateFormat(String originalDate) {
  final format = DateFormat("d/M/yyyy");
  final date = format.parse(originalDate);
  return DateFormat("yyyy-MM-dd").format(date);
}

String formatDateString(String dateString) {
  final Map<String, String> months = {
    '01': 'января',
    '02': 'февраля',
    '03': 'марта',
    '04': 'апреля',
    '05': 'мая',
    '06': 'июня',
    '07': 'июля',
    '08': 'августа',
    '09': 'сентября',
    '10': 'октября',
    '11': 'ноября',
    '12': 'декабря',
  };

  final parts = dateString.split('-');
  final year = parts[0];
  final month = months[parts[1]]!;
  final day = parts[2];

  String formattedDate = '$day ${month}, $year';

  return formattedDate;
}

class Money {
  static List<Expenses> income = [];
  static List<Expenses> expenses = [];
  static final StorageService storageService = StorageService();

  static Future<void> loadData() async {
    expenses = await storageService.loadExpenses();
  }

  static Future<void> clearExpenses() async {
    expenses.clear(); // Очищаем список расходов
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('expenses', []);
  }

  static Future<void> addExpense(Expenses expense) async {
    expenses.add(expense);
    final prefs = await SharedPreferences.getInstance();
    final updatedExpenses = expenses.map((e) => e.toString()).toList();
    await prefs.setStringList('expenses', updatedExpenses);
  }

  static Future<void> clearData() async {
    income.clear();
    expenses.clear();
    await storageService
        .saveExpenses([]); // Save an empty list to persist the state
  }

  static int getTotalSum() {
    int incomeSum = income.fold(0, (sum, expense) => sum + expense.sum);
    int expensesSum = expenses.fold(0, (sum, expense) => sum + expense.sum);
    return (incomeSum - expensesSum) * -1;
  }
}
