import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final ChallengeController controller = ChallengeController();
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CloseButton(),
              ValueListenableBuilder(
                valueListenable: controller.currentPageNotifier,
                builder: (_, __, ___) {
                  return QuestionIndicatorWidget(
                    currentPage: controller.currentPage,
                    length: widget.questions.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map((e) => QuizWidget(
                    onChange: nextPage,
                    question: e,
                  ))
              .toList(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentPageNotifier,
          builder: (_, int value, ___) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (value < widget.questions.length)
                Expanded(
                    child: NextButtonWidget.white(
                  label: 'Pular',
                  onTap: nextPage,
                )),
              if (value == widget.questions.length)
                Expanded(
                    child: NextButtonWidget.green(
                  label: 'Confirmar',
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            ],
          ),
        ),
      ),
    );
  }
}
