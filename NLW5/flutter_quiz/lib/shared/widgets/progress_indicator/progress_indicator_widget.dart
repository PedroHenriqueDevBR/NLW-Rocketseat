import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  ProgressIndicatorWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.getColorTheme(lightColor: AppColors.chartSecondary, darkColor: AppColors.white),
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
