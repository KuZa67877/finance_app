import 'package:finance_app/core/textfield.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CreditScreen extends StatefulWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  final sumController = TextEditingController();
  final depositController = TextEditingController();
  final termController = TextEditingController();
  final procentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: Padding(
        padding: const EdgeInsets.only(top: 88.0, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ипотечный\nкалькулятор",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey)),
              const Text(
                "Стоимость имущества",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.deepGrey,
                    fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                child: TextFieldWidget(
                  width: 358,
                  info: "",
                  controller: sumController,
                  isString: false,
                ),
              ),
              const Text("Первоначальный взнос",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.deepGrey)),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: TextFieldWidget(
                  width: 358,
                  info: "",
                  controller: depositController,
                  isString: false,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 143, bottom: 8),
                    child: Text(
                      "Срок",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.deepGrey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("% ставка",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.deepGrey)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFieldWidget(
                        info: "",
                        controller: termController,
                        isString: false,
                        width: 175),
                  ),
                  TextFieldWidget(
                      info: "",
                      controller: procentController,
                      isString: false,
                      width: 175)
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 16),
                  child: ElevatedButton(
                    child: Text("Рассчитать"),
                    onPressed: () {
                      double sum = double.parse(sumController.text);
                      double deposit = double.parse(depositController.text);
                      int term = int.parse(termController.text);
                      double percentRate = double.parse(procentController.text);

                      double mainDebt = sum - deposit;
                      double monthlyPayment =
                          (mainDebt + (mainDebt * percentRate / 100 * term)) /
                              term;
                      double accruedInterest =
                          mainDebt * percentRate / 100 * term;
                      double totalDebt = mainDebt + accruedInterest;

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.backgroundBlue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          maxChildSize: 0.9,
                          minChildSize: 0.32,
                          expand: false,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: CreditOptionsScreen(
                                mainDebt: mainDebt,
                                percentRate: percentRate,
                                monthlyPayment: monthlyPayment,
                                accruedInterest: accruedInterest,
                                totalDebt: totalDebt,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CreditOptionsScreen extends StatefulWidget {
  final double mainDebt;
  final double percentRate;
  final double monthlyPayment;
  final double accruedInterest;
  final double totalDebt;

  const CreditOptionsScreen({
    Key? key,
    required this.mainDebt,
    required this.percentRate,
    required this.monthlyPayment,
    required this.accruedInterest,
    required this.totalDebt,
  }) : super(key: key);

  @override
  State<CreditOptionsScreen> createState() => _CreditOptionsScreenState();
}

class _CreditOptionsScreenState extends State<CreditOptionsScreen> {
  final theme = getTheme().textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 15,
          child: Container(
            width: 36,
            height: 5,
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.darkBlue,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Text(
                    "Ипотечный калькулятор\nпосчитал",
                    style: theme.bodyLarge,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.clear),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.darkBlue),
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Процентная ставка",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.deepGrey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 16),
              child: ProgressBarWidget(percentage: 48),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Основной долг",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.deepGrey)),
              ),
            ),
            ProgressBarWidget(percentage: 52),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(8)),
                height: 108,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Text(
                            "Основной долг",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.grey),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Text(
                            "${widget.mainDebt} ₽",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.deepGrey),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.backgroundBlue,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Процентная ставка",
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkBlue,
                    borderRadius: BorderRadius.circular(8)),
                height: 162,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Text(
                            "Ежемесячная оплата",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 16),
                          child: Text(
                            "${widget.monthlyPayment} ₽",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.deepGrey),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.backgroundBlue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Начисленно процентов",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.grey),
                          ),
                          Text(
                            "${widget.accruedInterest} ₽ ",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.deepGrey),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: AppColors.backgroundBlue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Долг + проценты",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.grey),
                          ),
                          Text(
                            "${widget.totalDebt} ₽ ",
                            style: const TextStyle(
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
            )
          ],
        )
      ],
    );
  }
}

class ProgressBarWidget extends StatelessWidget {
  final double percentage;

  ProgressBarWidget({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: percentage / 100,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                "$percentage %",
                style: TextStyle(
                    color: AppColors.backgroundBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
