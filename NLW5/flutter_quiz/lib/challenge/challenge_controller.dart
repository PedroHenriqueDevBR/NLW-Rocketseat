import 'package:flutter/material.dart';

class ChallengeController {
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(1);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
  int rightAnswersAcount = 0;
}
