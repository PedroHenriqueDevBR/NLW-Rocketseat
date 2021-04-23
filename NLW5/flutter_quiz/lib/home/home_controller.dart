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
  ValueNotifier<List<QuizModel>> quizzes = ValueNotifier<List<QuizModel>>([]);
  ValueNotifier<String> selectedLevel = ValueNotifier<String>('');

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

  Future<void> getQuizzes({String? search}) async {
    List<QuizModel> out = [];
    if (search != null) {
      List<QuizModel> response = await repository.getQuizzes();
      for (QuizModel quizModel in response) {
        if (quizModel.level == search.levelParse) {
          out.add(quizModel);
        }
      }
    } else {
      out = await repository.getQuizzes();
    }
    quizzes.value = out;
  }

  void selectLevel({required String level}) {
    if (selectedLevel.value == level) {
      selectedLevel.value = '';
      getQuizzes();
    } else {
      selectedLevel.value = level;
      getQuizzes(search: level);
    }
  }
}
