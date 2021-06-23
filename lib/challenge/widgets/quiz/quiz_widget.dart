import 'package:flutter/material.dart';
import 'package:quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:quiz/core/app_text_styles.dart';
import 'package:quiz/shared/models/awnser_model.dart';
import 'package:quiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key key, this.question, this.onSelected}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelectd = -1;
  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              anwser: awnser(i),
              disable: indexSelectd != -1,
              isSelected: indexSelectd == i,
              onTap: ((value) {
                indexSelectd = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1 )).then((_) => widget.onSelected(value));
              }),
            ),
        ],
      ),
    );
  }
}
