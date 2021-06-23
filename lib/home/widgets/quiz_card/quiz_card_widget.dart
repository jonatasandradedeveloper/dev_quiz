import 'package:flutter/material.dart';
import 'package:quiz/core/app_colors.dart';
import 'package:quiz/core/app_images.dart';
import 'package:quiz/core/app_text_styles.dart';
import 'package:quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({Key key, this.title, this.completed, this.percent, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 20),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(completed, style: AppTextStyles.body11)),
                Expanded(
                    flex: 3,
                    child: ProgressIndicatorWidget(
                      value: percent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}