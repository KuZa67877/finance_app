import 'package:finance_app/colors.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultSettingsButton extends StatefulWidget {
  final String picturePath;
  final String text;
  const DefaultSettingsButton(
      {super.key, required this.text, required this.picturePath});

  @override
  State<DefaultSettingsButton> createState() => _DefaultSettingsButtonState();
}

class _DefaultSettingsButtonState extends State<DefaultSettingsButton> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 358,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.darkBlue),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Используйте это свойство
                children: [
                  Row(
                    // Оберните текст и иконку в Row
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(widget.picturePath),
                      ),
                      Text(
                        widget.text,
                        style: theme.bodyMedium,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                      "assets/chevron_right.svg") // Иконка будет прибита к правому краю
                ],
              ),
            ),
          )),
    );
  }
}

class ReloadSumButton extends StatefulWidget {
  const ReloadSumButton({super.key});

  @override
  State<ReloadSumButton> createState() => _ReloadSumButtonState();
}

class _ReloadSumButtonState extends State<ReloadSumButton> {
  final theme = getTheme().textTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 358,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.darkBlue),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // Используйте Expanded для растягивания текста
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Выравнивание по центру
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset("assets/reload.svg"),
                        ),
                        Text(
                          "Перезагрузить сумму",
                          style: theme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  // Иконка будет прибита к правому краю, если она добавлена здесь
                ],
              ),
            ),
          )),
    );
  }
}
