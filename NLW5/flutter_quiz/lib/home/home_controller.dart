import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  HomeRepository repository = HomeRepository();

  UserModel? user;
  List<QuizModel>? quizzes;

  void getData() async {
    state = HomeState.loading;
    try {
      await getUser();
      await getQuizzes();
      state = HomeState.success;
    } catch (error) {
      state = HomeState.error;
    }
  }

  Future<void> getUser() async {
    user = await repository.getUser();
  }

  Future<void> getQuizzes() async {
    quizzes = await repository.getQuizzes();
  }
}
