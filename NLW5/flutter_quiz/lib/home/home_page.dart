import 'package:DevQuiz/app_controller.dart';
import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    controller.selectedLevel.addListener(() {
      controller.getQuizzes(search: controller.selectedLevel.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                    selected: controller.selectedLevel.value == 'facil',
                    onTap: () {
                      controller.selectLevel(level: 'facil');
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                    selected: controller.selectedLevel.value == 'medio',
                    onTap: () {
                      controller.selectLevel(level: 'medio');
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                    selected: controller.selectedLevel.value == 'dificil',
                    onTap: () {
                      controller.selectLevel(level: 'dificil');
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                    selected: controller.selectedLevel.value == 'perito',
                    onTap: () {
                      controller.selectLevel(level: 'perito');
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: controller.quizzes.value
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          imageName: e.image,
                          completed: '${e.questionAnswered}/${e.questions.length}',
                          percent: e.questionAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ChallengePage(questions: e.questions, title: e.title),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade800,
          child: Icon(
            Icons.nightlight_round,
            color: Colors.yellow.shade200,
          ),
          onPressed: () {
            AppController appController = AppController.instance;
            appController.toggleThemeMode();
          },
        ),
      );
    } else if (controller.state == HomeState.error) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.error),
              Text('Erro ao carregar os dados!', style: AppTextStyles.heading),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
