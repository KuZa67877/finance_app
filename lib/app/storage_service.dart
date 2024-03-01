import 'package:finance_app/app/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveExpenses(List<Expenses> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'expenses', expenses.map((e) => e.toString()).toList());
  }

  Future<List<Expenses>> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final expensesStrings = prefs.getStringList('expenses') ?? [];
    return expensesStrings.map((e) => Expenses.fromString(e)).toList();
  }
}
