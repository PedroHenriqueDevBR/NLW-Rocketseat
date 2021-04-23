import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String imageName;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.imageName,
    required this.completed,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.getColorTheme(lightColor: AppColors.border, darkColor: AppColors.grey))),
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset('${AppImages.baseImages}$imageName'),
            ),
            SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.heading15.copyWith(
                color: AppColors.getColorTheme(lightColor: AppColors.black, darkColor: AppColors.white),
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    completed,
                    style: AppTextStyles.body11.copyWith(
                      color: AppColors.getColorTheme(lightColor: AppColors.grey, darkColor: AppColors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(value: percent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
