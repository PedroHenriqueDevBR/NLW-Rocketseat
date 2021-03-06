import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  String label;
  bool selected;
  VoidCallback onTap;

  LevelButtonWidget({
    required String this.label,
    this.selected = false,
    required this.onTap,
  }) : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label));

  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'fontColor': AppColors.levelButtonTextFacil,
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'fontColor': AppColors.levelButtonTextMedio,
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'fontColor': AppColors.levelButtonTextDificil,
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'fontColor': AppColors.levelButtonTextPerito,
    }
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: color, border: Border.fromBorderSide(BorderSide(color: borderColor)), borderRadius: BorderRadius.circular(28.0), boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 3,
            color: selected ? fontColor : Colors.transparent,
            spreadRadius: 1.0,
          ),
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              color: fontColor,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }
}
