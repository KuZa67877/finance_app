import 'package:finance_app/colors.dart';
import 'package:finance_app/default_button.dart';
import 'package:finance_app/textfield.dart';
import 'package:finance_app/theme.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.backgroundBlue,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Добавить расходы",
                  style: theme.bodyLarge,
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
            const Text("Описание"),
            TextFieldWidget(info: "Например (Покупка велосипеда)"),
            Text("Сумма"),
            TextFieldWidget(info: "0 Р"),
            Text("Дата"),
            TextFieldWidget(info: ""),
            Text("Категории"),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: DefaultButton(text: "Добавить"),
            )
          ],
        )
      ],
    );
  }
}
