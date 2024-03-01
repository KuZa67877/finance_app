import 'package:finance_app/app/info.dart';
import 'package:finance_app/res/colors.dart';
import 'package:finance_app/core/buttons/default_button.dart';
import 'package:finance_app/core/textfield.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SignInOptionsScreen extends StatefulWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  State<SignInOptionsScreen> createState() => _SignInOptionsScreenState();
}

class _SignInOptionsScreenState extends State<SignInOptionsScreen> {
  final theme = getTheme().textTheme;
  int? selectedButton;
  final options = GroupButtonOptions(
    selectedShadow: const [],
    selectedTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkBlue,
    ),
    selectedColor: AppColors.white,
    unselectedShadow: const [],
    unselectedColor: AppColors.darkBlue,
    unselectedTextStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
    ),

    borderRadius: BorderRadius.circular(8),
    // spacing: 10,
    // runSpacing: 10,
    // groupingType: GroupingType.wrap,
    // direction: Axis.horizontal,
    buttonHeight: 40,
    //buttonWidth: 40,
    // mainGroupAlignment: MainGroupAlignment.start,
    // crossGroupAlignment: CrossGroupAlignment.start,
    // groupRunAlignment: GroupRunAlignment.start,
    // textAlign: TextAlign.center,
    textPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    // alignment: Alignment.center,
    // elevation: 0,
  );
  final descriptionController = TextEditingController();
  final sumController = TextEditingController();
  final dateController = TextEditingController();
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
                    "Добавить расходы",
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
                  "Описание",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.deepGrey),
                ),
              ),
            ),
            TextFieldWidget(
              info: "Например (Покупка велосипеда)",
              controller: descriptionController,
              isString: true,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Сумма",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.deepGrey)),
              ),
            ),
            TextFieldWidget(
              info: "0 Р",
              controller: sumController,
              isString: false,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Дата",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.deepGrey)),
              ),
            ),
            TextFieldWidget(
              info: "",
              controller: dateController,
              isString: true,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Категории",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.deepGrey)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GroupButton(
                    options: options,
                    isRadio: true,
                    onSelected: (index, isSelected, selectedIndex) {
                      if (isSelected == selectedIndex) {
                        print('$index button is selected');
                      } else {
                        print('$index button is deselected');
                      }
                    },
                    buttons: ["Заработная плата", "Инвестиции", "Выигрыш"],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Предположим, что вы уже создали новый объект Expenses
                  Expenses newExpense = Expenses(
                    sum: int.parse(sumController.text),
                    theme: 1, // Вам нужно будет определить, как выбирается тема
                    description: descriptionController.text,
                    date: dateController.text,
                  );
                  //Money.addExpense(newExpense);
                  Navigator.pop(
                      context, newExpense); // Передаем новый расход обратно
                },
                child: Text("Добавить"),
              ),
            )
          ],
        )
      ],
    );
  }
}
