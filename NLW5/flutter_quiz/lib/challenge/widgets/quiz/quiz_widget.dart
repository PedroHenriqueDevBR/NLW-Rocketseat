import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  AwnserModel awnser(int index) => widget.question.awnsers[index];
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 64.0),
        Text(
          widget.question.title,
          style: AppTextStyles.heading.copyWith(
            color: AppColors.getColorTheme(
              lightColor: AppColors.black,
              darkColor: AppColors.white,
            ),
          ),
        ),
        SizedBox(height: 24.0),
        for (int i = 0; i < widget.question.awnsers.length; i++)
          AwnserWidget(
            awnser: awnser(i),
            isSelected: indexSelected == i,
            disabled: indexSelected != -1,
            onTap: (value) {
              indexSelected = i;
              Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(value));
              setState(() {});
            },
          ),
      ],
    );
  }
}
