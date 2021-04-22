import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  late String label;
  late Color backgroundColor;
  late Color fontColor;
  late Color borderColor;
  late VoidCallback onTap;

  NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.label = label,
        this.fontColor = AppColors.white,
        this.backgroundColor = AppColors.darkGreen,
        this.borderColor = AppColors.darkGreen,
        this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap, BuildContext? context}) {
    this.label = label;
    this.fontColor = AppColors.getColorTheme(lightColor: AppColors.lightGrey, darkColor: AppColors.white);
    this.backgroundColor = context != null ? Theme.of(context).cardColor : AppColors.white;
    this.borderColor = AppColors.getColorTheme(lightColor: AppColors.border, darkColor: AppColors.grey);
    this.onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          side: BorderSide(color: borderColor),
          primary: Colors.grey,
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
