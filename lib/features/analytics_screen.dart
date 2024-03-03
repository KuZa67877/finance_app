import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:finance_app/app/info.dart';
import 'package:finance_app/app/storage_service.dart';
import 'package:hive/hive.dart';

class ExpensesBarChartScreen extends StatefulWidget {
  @override
  _ExpensesBarChartScreenState createState() => _ExpensesBarChartScreenState();
}

class _ExpensesBarChartScreenState extends State<ExpensesBarChartScreen> {
  late Future<List<Expenses>> _expensesFuture;

  @override
  void initState() {
    super.initState();
    _expensesFuture = Money.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бар-диаграмма доходов и расходов'),
      ),
      // body: FutureBuilder<List<Expenses>>(
      //   future: _expensesFuture,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text('Ошибка загрузки данных'));
      //     } else {
      //       return BarChart(
      //         BarChartData(
      //           barGroups: _createBarGroups(snapshot.data!),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  // List<BarChartGroupData> _createBarGroups(List<Expenses> expenses) {
  //   // Сначала сгруппируйте данные по датам и суммируйте значения
  //   Map<DateTime, int> expensesByDate = {};
  //   for (var expense in expenses) {
  //     if (expensesByDate.containsKey(expense.dateTime)) {
  //       expensesByDate[expense.dateTime] =
  //           expensesByDate[expense.dateTime]! + expense.sum;
  //     } else {
  //       expensesByDate[expense.dateTime] = expense.sum;
  //     }
  //   }

  //   // Преобразуйте данные в BarChartGroupData
  //   List<BarChartGroupData> barGroups = [];
  //   for (var entry in expensesByDate.entries) {
  //     barGroups.add(
  //       BarChartGroupData(
  //         x: entry.key.day, // Используйте день как значение x
  //         barRods: [
  //           BarChartRodData(
  //             toY: entry.value.toDouble(),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   return barGroups;
  // }
}
