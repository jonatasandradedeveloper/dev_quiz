import 'package:flutter/material.dart';
import 'package:quiz/core/app_colors.dart';
import 'package:quiz/core/app_text_styles.dart';
import 'package:quiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disable;

  const AwnserWidget(
      {Key key,
      this.anwser,
      this.isSelected = false,
      this.onTap,
      this.disable = false})
      : super(key: key);

  Color get _selectedColorRight =>
      anwser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBordeCardRight =>
      anwser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      anwser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => anwser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: IgnorePointer(
        ignoring: disable,
        child: GestureDetector(
          onTap: () {
            onTap(anwser.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBordeCardRight
                        : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    anwser.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.fromBorderSide(BorderSide(
                          color: isSelected
                              ? _selectedBorderRight
                              : AppColors.border)),
                    ),
                    child: isSelected
                        ? Icon(
                            _selectedIconRight,
                            color: AppColors.white,
                            size: 16,
                          )
                        : null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
