import 'package:finance_app/app/info.dart';
import 'package:finance_app/features/bar_graph/individual_bar.dart';

class BarData {
  List<IndividualBar> graphData = [];

  void initializeDataFromExpenses(List<Expenses> expenses) {
    Map<int, double> expensesData = {};

    for (var expense in expenses) {
      int dayOfMonth = expense.dateTime.day;
      if (expensesData.containsKey(dayOfMonth)) {
        double currentAmount = expensesData[dayOfMonth]!;
        expensesData[dayOfMonth] = currentAmount + expense.sum.toDouble();
      } else {
        expensesData[dayOfMonth] = expense.sum.toDouble();
      }
    }

    graphData = [];
    for (int i = 1; i <= 31; i++) {
      double amount = expensesData.containsKey(i) ? expensesData[i]! : 0;
      graphData.add(IndividualBar(x: i, y: amount));
    }
  }
}
