import 'package:flutter/material.dart';
import 'package:quiz/core/app_colors.dart';
import 'package:quiz/core/app_text_styles.dart';
import 'package:quiz/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key key, this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGrey,
                offset: const Offset(
                  0,
                  0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(
                  percent: percent,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Vamos começar", style: AppTextStyles.heading),
                      Text("Complete os desafios e avance em conhecimentos",
                          style: AppTextStyles.body)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
