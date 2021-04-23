import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Parabéns',
                  style: AppTextStyles.heading40.copyWith(
                    color: AppColors.getColorTheme(
                      lightColor: AppColors.black,
                      darkColor: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu ',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.getColorTheme(
                        lightColor: AppColors.grey,
                        darkColor: AppColors.white,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: '\n$title',
                        style: AppTextStyles.bodyBold.copyWith(
                          color: AppColors.getColorTheme(
                            lightColor: AppColors.grey,
                            darkColor: AppColors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '\ncom $result de $length acertos.',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.getColorTheme(
                            lightColor: AppColors.grey,
                            darkColor: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 68),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share('DevQuiz NLW#5 - Flutter: Rsultado do Quiz: $title \n${result / length} de acerto.');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.transparent(
                          label: 'Voltar ao início',
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                              (route) => false,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
