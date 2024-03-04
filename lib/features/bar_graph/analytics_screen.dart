import 'package:finance_app/core/buttons/split_buttons.dart';
import 'package:finance_app/features/bar_graph/bar_data.dart';
import 'package:finance_app/features/bar_graph/bar_graph.dart';
import 'package:finance_app/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:finance_app/app/info.dart'; // Импортируйте ваш класс Expenses

class AnalycisScreen extends StatefulWidget {
  const AnalycisScreen({super.key});

  @override
  State<AnalycisScreen> createState() => _AnalycisScreenState();
}

class _AnalycisScreenState extends State<AnalycisScreen> {
  @override
  void initState() {
    super.initState();
    Money.loadData();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Money.loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while data is being loaded
          return Scaffold(
            backgroundColor: AppColors.backgroundBlue,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle error loading data
          return Scaffold(
            backgroundColor: AppColors.backgroundBlue,
            body: const Center(
              child: Text('Error loading data'),
            ),
          );
        } else {
          // Data is loaded, create the graph
          BarData barData = BarData();
          barData.initializeDataFromExpenses(Money.expenses);

          return Scaffold(
            backgroundColor: AppColors.backgroundBlue,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 44, right: 16),
                    child: Text(
                      "Аналитика",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: AppColors.grey),
                    ),
                  ),
                  DateSplitButtons(
                      selectedIndex: _selectedIndex,
                      onSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        height: 283,
                        width: 358,
                        child: WeekBarGraph(
                          barData: barData,
                          maxY: 100,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Общая сумма",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "${Money.getTotalSum()} ₽",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.deepGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(8)),
                      height: 108,
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Text(
                                  "Доходы",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.grey),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Text(
                                  " ₽", //add sum
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.deepGrey),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.backgroundBlue,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Расходы",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.grey),
                                ),
                                Text(
                                  "421208 ₽ ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.deepGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
