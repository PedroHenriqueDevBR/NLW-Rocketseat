import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80.0,
              height: 80.0,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: 0.75,
                backgroundColor: AppColors.getColorTheme(lightColor: AppColors.chartSecondary, darkColor: AppColors.white),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              '75%',
              style: AppTextStyles.heading.copyWith(
                color: AppColors.getColorTheme(lightColor: Colors.black, darkColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
