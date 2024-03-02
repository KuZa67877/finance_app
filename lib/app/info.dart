import 'package:finance_app/app/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expenses {
  final int sum;
  final int theme;
  final String description;
  final String date;
  Expenses(
      {required this.sum,
      required this.theme,
      required this.description,
      required this.date});
  @override
  String toString() {
    return '$sum|$theme|$description|$date';
  }

  static Expenses fromString(String expenseString) {
    final parts = expenseString.split('|');
    return Expenses(
      sum: int.parse(parts[0]),
      theme: int.parse(parts[1]),
      description: parts[2],
      date: parts[3],
    );
  }
}

class Money {
  static List<Expenses> income = [];
  static List<Expenses> expenses = [];
  static final StorageService storageService = StorageService();

  static Future<void> loadData() async {
    expenses = await storageService.loadExpenses();
  }

  static Future<void> clearIncome() async {
    income.clear(); // Очищаем список доходов
    // Если необходимо, сохраняем изменения в хранилище
    // Например, если вы используете SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('income', []);
  }

  static Future<void> addExpense(Expenses expense) async {
    expenses.add(expense);
    await storageService.saveExpenses(expenses);
  }

  static int getTotalSum() {
    int incomeSum = income.fold(0, (sum, expense) => sum + expense.sum);
    int expensesSum = expenses.fold(0, (sum, expense) => sum + expense.sum);
    return incomeSum - expensesSum;
  }
}
