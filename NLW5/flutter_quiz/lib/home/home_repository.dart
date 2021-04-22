import 'dart:convert';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    try {
      final response = await rootBundle.loadString('database/user.json');
      final user = UserModel.fromJson(response);
      return user;
    } on Exception catch (e) {
      throw Exception();
    }
  }

  Future<List<QuizModel>> getQuizzes() async {
    try {
      final response = await rootBundle.loadString('database/quizzes.json');
      final list = jsonDecode(response) as List;
      final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
      return quizzes;
    } on Exception catch (e) {
      throw Exception();
    }
  }
}
