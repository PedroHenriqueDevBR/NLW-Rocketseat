import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quentão 04',
                style: AppTextStyles.body,
              ),
              Text(
                'de 10',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ProgressIndicatorWidget(value: 0.4),
        ],
      ),
    );
  }
}
