import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:finance_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplitButton extends StatefulWidget {
  final Function(int) onSelected;
  SplitButton({required this.onSelected});

  @override
  _SplitButtonState createState() => _SplitButtonState();
}

class _SplitButtonState extends State<SplitButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedButtonBar(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
      radius: 8.0,
      padding: const EdgeInsets.all(16.0),
      invertedSelection: true,
      children: [
        ButtonBarEntry(
            onTap: () {
              setState(() => _selectedIndex = 0);
              widget.onSelected(0); // Вызываем callback
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _selectedIndex == 0
                    ? SvgPicture.asset("assets/arrow_up1.svg")
                    : SvgPicture.asset("assets/arrow_up.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Доходы',
                      style: TextStyle(
                          color: _selectedIndex == 0
                              ? AppColors.white
                              : AppColors.grey)),
                ),
              ],
            )),
        ButtonBarEntry(
            onTap: () {
              setState(() => _selectedIndex = 1);
              widget.onSelected(1); // Вызываем callback
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _selectedIndex == 1
                    ? SvgPicture.asset("assets/arrow_down.svg")
                    : SvgPicture.asset("assets/arrow_down1.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text('Расходы',
                      style: TextStyle(
                          color: _selectedIndex == 1
                              ? AppColors.white
                              : AppColors.grey)),
                ),
              ],
            )),
      ],
    );
  }
}

class DateSplitButtons extends StatefulWidget {
  final Function(int) onSelected;
  const DateSplitButtons({super.key, required this.onSelected});

  @override
  State<DateSplitButtons> createState() => _DateSplitButtonsState();
}

class _DateSplitButtonsState extends State<DateSplitButtons> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedButtonBar(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
      radius: 8.0,
      padding: const EdgeInsets.all(16.0),
      invertedSelection: true,
      children: [
        // Добавляем кнопки для выбора периода
        ButtonBarEntry(
            onTap: () {
              setState(() => _selectedIndex = 2);
              widget.onSelected(2); // Вызываем callback с индексом для недели
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Неделя',
                    style: TextStyle(
                        color: _selectedIndex == 2
                            ? AppColors.white
                            : AppColors.grey)),
              ],
            )),
        ButtonBarEntry(
            onTap: () {
              setState(() => _selectedIndex = 3);
              widget.onSelected(3); // Вызываем callback с индексом для месяца
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Месяц',
                    style: TextStyle(
                        color: _selectedIndex == 3
                            ? AppColors.white
                            : AppColors.grey)),
              ],
            )),
        ButtonBarEntry(
            onTap: () {
              setState(() => _selectedIndex = 4);
              widget.onSelected(4); // Вызываем callback с индексом для года
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Год',
                    style: TextStyle(
                        color: _selectedIndex == 4
                            ? AppColors.white
                            : AppColors.grey)),
              ],
            )),
        // Оставшаяся часть кода остается без изменений
      ],
    );
  }
}
