import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percent;
  const ChartWidget({Key? key, required this.percent}) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Stack(
            children: [
              Center(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value,
                    backgroundColor: AppColors.getColorTheme(lightColor: AppColors.chartSecondary, darkColor: AppColors.white),
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${(_animation.value * 100).toInt()}%',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.getColorTheme(lightColor: Colors.black, darkColor: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
