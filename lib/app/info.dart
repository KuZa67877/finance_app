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
}

class Money {
  static List<Expenses> income = [];
  static List<Expenses> expenses = [];
  int getTotalSum() {
    int incomeSum = 0;
    int expensesSum = 0;
    for (int i = 0; i < income.length; i++) {
      incomeSum += income[i].sum;
    }
    for (int i = 0; i < expenses.length; i++) {
      expensesSum += expenses[i].sum;
    }
    return incomeSum + expensesSum;
  }
}
