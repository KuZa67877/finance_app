import 'package:finance_app/res/colors.dart';
import 'package:finance_app/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFieldWidget extends StatefulWidget {
  final String info;
  final TextEditingController controller;
  final bool isString;
  final int width;
  const TextFieldWidget(
      {super.key,
      required this.info,
      required this.controller,
      required this.isString,
      required this.width});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.toDouble(),
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.darkBlue),
      child: TextField(
        style: TextStyle(
            color: AppColors.grey, fontWeight: FontWeight.w400, fontSize: 14),
        keyboardType:
            widget.isString ? TextInputType.text : TextInputType.number,
        controller: widget.controller,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.info,
          hintStyle: theme.bodyMedium,
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}

class DateTextField extends StatefulWidget {
  final String info;
  final TextEditingController controller;
  final bool isString;
  const DateTextField(
      {super.key,
      required this.info,
      required this.controller,
      required this.isString});

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        width: 358,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: AppColors.darkBlue),
      ),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) => SizedBox(
            height: 250,
            child: CupertinoDatePicker(
                initialDateTime: _date,
                backgroundColor: AppColors.white,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    _date = newTime;
                    widget.controller.text =
                        "${newTime.day}/${newTime.month}/${newTime.year}";
                  });
                }),
          ),
        );
      },
    );
  }
}
