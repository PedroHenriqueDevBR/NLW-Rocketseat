import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled;

  AwnserWidget({
    Key? key,
    required this.awnser,
    this.isSelected = false,
    required this.onTap,
    required this.disabled,
  }) : super(key: key);

  Color get _selectedColorRight => awnser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight => awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight => awnser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight => awnser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => awnser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected
                      ? _selectedBorderCardRight
                      : AppColors.getColorTheme(
                          lightColor: AppColors.border,
                          darkColor: AppColors.grey,
                        ),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      awnser.title,
                      style: isSelected
                          ? _selectedTextStyleRight
                          : AppTextStyles.body.copyWith(
                              color: AppColors.getColorTheme(
                                lightColor: AppColors.grey,
                                darkColor: AppColors.white,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(BorderSide(
                        color: isSelected ? _selectedBorderRight : AppColors.border,
                      )),
                    ),
                    child: isSelected
                        ? Icon(
                            _selectedIconRight,
                            size: 16.0,
                            color: AppColors.white,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
