import 'package:finance_app/app/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expenses {
  final int sum;
  final String theme;
  final String description;
  final DateTime dateTime; // Новое поле для хранения даты в формате DateTime

  Expenses({
    required this.sum,
    required this.theme,
    required this.description,
    required this.dateTime, // Используйте dateTime для создания объекта
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
      dateTime: DateTime.parse(
          convertDateFormat(parts[3])), // Преобразуем строку обратно в DateTime
    );
  }
}

String convertDateFormat(String originalDate) {
  final format = DateFormat("d/M/yyyy");
  final date = format.parse(originalDate);
  return DateFormat("yyyy-MM-dd").format(date);
}

String formatDateString(String dateString) {
  // Словари для месяцев и дней недели на русском языке
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

  // Разделение строки даты на составляющие
  final parts = dateString.split('-');
  final year = parts[0];
  final month = months[parts[
      1]]!; // Используем map для преобразования числового представления месяца в название
  final day = parts[2];

  // Формирование строки даты в требуемом формате
  String formattedDate = '$day ${month}, $year';

  return formattedDate;
}

class Money {
  static List<Expenses> income = [];
  static List<Expenses> expenses = [];

  static Future<List<Expenses>> loadData() async {
    final expensesBox = Hive.box<List<Expenses>>('expenses');
    List<Expenses> expenses = expensesBox.get('expenses') ?? [];
    // Возвращаем список объектов Expenses
    return expenses;
  }

  static Future<void> clearExpenses() async {
    expenses.clear();
    final expensesBox = Hive.box<List<Expenses>>('expenses');
    await expensesBox.put('expenses', []);
  }

  static Future<void> addExpense(Expenses expense) async {
    expenses.add(expense);
    final expensesBox = Hive.box<List<Expenses>>('expenses');
    await expensesBox.put('expenses', expenses);
  }

  static Future<void> clearData() async {
    income.clear();
    expenses.clear();
    final expensesBox = Hive.box<List<Expenses>>('expenses');
    await expensesBox.put('expenses', []);
  }

  static int getTotalSum() {
    int incomeSum = income.fold(0, (sum, expense) => sum + expense.sum);
    int expensesSum = expenses.fold(0, (sum, expense) => sum + expense.sum);
    return (incomeSum - expensesSum) * -1;
  }
}
