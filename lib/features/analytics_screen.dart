// import 'package:finance_app/app/info.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BarGraph extends StatefulWidget {
//   final List<Expenses> income;
//   final List<Expenses> expenses;
//   final DateTime selectedRange;

//   BarGraph({required this.income, required this.expenses, required this.selectedRange});

//   @override
//   _BarGraphState createState() => _BarGraphState();
// }

// class _BarGraphState extends State<BarGraph> {
//   List<BarChartGroupData> _barData = [];

//   @override
//   void initState() {
//     super.initState();
//     _updateBarData();
//   }

//   void _updateBarData() {
//     final now = DateTime.now();
//     final startDate = _getStartDate(widget.selectedRange);
//     final endDate = _getEndDate(widget.selectedRange);

//     final incomeData = _filterData(widget.income, startDate, endDate);
//     final expensesData = _filterData(widget.expenses, startDate, endDate);

//     final totalSum = incomeData.fold(0, (sum, expense) => sum + expense.sum) -
//         expensesData.fold(0, (sum, expense) => sum + expense.sum);

//     setState(() {
//       _barData = [
//         BarChartGroupData(
//           x: 0,
//           barsSpace: 4,
//           showingTooltipIndicators: [0],
//           children: [
//             BarChartRodData(
//               y: totalSum,
//               width: 12,
//               colors: [AppColors.green],
//               borderRadius: BorderRadius.circular(8),
//               backDrawRodData: BackgroundBarChartRodData(
//                 show: true,
//                 toY: 0,
//                 colors: [AppColors.white],
//               ),
//             ),
//           ],
//         ),
//         BarChartGroupData(
//           x: 1,
//           barsSpace: 4,
//           showingTooltipIndicators: [0],
//           children: [
//             BarChartRodData(
//               y: incomeData.fold(0, (sum, expense) => sum + expense.sum),
//               width: 12,
//               colors: [AppColors.green],
//               borderRadius: BorderRadius.circular(8),
//               backDrawRodData: BackgroundBarChartRodData(
//                 show: true,
//                 toY: 0,
//                 colors: [AppColors.white],
//               ),
//             ),
//           ],
//         ),
//         BarChartGroupData(
//           x: 2,
//           barsSpace: 4,
//           showingTooltipIndicators: [0],
//           children: [
//             BarChartRodData(
//               y: expensesData.fold(0, (sum, expense) => sum + expense.sum),
//               width: 12,
//               colors: [AppColors.red],
//               borderRadius: BorderRadius.circular(8),
//               backDrawRodData: BackgroundBarChartRodData(
//                 show: true,
//                 toY: 0,
//                 colors: [AppColors.white],
//               ),
//             ),
//           ],
//         ),
//       ];
//     });
//   }

//   List<Expenses> _filterData(List<Expenses> data, DateTime startDate, DateTime endDate) {
//     return data.where((expense) {
//       final expenseDate = DateTime.parse(expense.date);
//       return expense
      
//         @override
//         Widget build(BuildContext context) {
//           // TODO: implement build
//           throw UnimplementedError();
//         }
//       }