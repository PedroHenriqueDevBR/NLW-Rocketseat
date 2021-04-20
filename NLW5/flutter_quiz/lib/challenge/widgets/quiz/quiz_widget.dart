import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24.0),
        AwnserWidget(
          title: 'Possibilita a criação de aplicativos compilados nativamente',
          isRight: true,
          isSelected: true,
        ),
        AwnserWidget(
          title: 'Possibilita a criação de aplicativos compilados nativamente',
          isRight: false,
          isSelected: false,
        ),
        AwnserWidget(
          title: 'Possibilita a criação de aplicativos compilados nativamente',
          isRight: false,
          isSelected: false,
        ),
        AwnserWidget(
          title: 'Possibilita a criação de aplicativos compilados nativamente',
          isRight: false,
          isSelected: false,
        ),
      ],
    );
  }
}
