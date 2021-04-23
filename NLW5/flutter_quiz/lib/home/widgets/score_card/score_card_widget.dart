import 'package:flutter/material.dart';

import 'package:DevQuiz/app_controller.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 136.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: ChartWidget(percent: percent),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Vamos começar',
                        style: AppTextStyles.heading.copyWith(
                          color: AppColors.getColorTheme(lightColor: AppColors.black, darkColor: AppColors.white),
                        ),
                      ),
                      Text(
                        'Complete os desafios e avance em conhecimento.',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.getColorTheme(lightColor: AppColors.grey, darkColor: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
