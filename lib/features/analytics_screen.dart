// import 'package:finance_app/app/info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_charts/flutter_charts.dart' as charts;

// class BarGraphWidget extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//     // Подготовка данных для графика
//     final List<Series<Expenses, String>> chartData = [
//       Series<Expenses, String>(
//         id: 'Expenses',
//         colorFn: (Expenses expense, _) => Colors.red,
//         domainFn: (Expenses expense, _) => expense.theme,
//         measureFn: (Expenses expense, _) => expense.sum,
//         data: Money.expenses,
//       ),
//       charts.Series<Expenses, String>(
//         id: 'Income',
//         colorFn: (Expenses expense, _) => Colors.green,
//         domainFn: (Expenses expense, _) => expense.theme,
//         measureFn: (Expenses expense, _) => expense.sum,
//         data: Money.income,
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bar Graph'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BarChart(
//           chartData,
//           animate: true,
//         ),
//       ),
//     );
//  }
// }
