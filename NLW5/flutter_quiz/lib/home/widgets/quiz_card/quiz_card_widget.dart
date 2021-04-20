import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 24),
          Text(
            'Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '3 de 10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 4,
                child: ProgressIndicatorWidget(value: 0.75),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
