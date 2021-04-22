import 'package:flutter/material.dart';

class ChallengeController {
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
}
