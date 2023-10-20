import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScore extends ChangeNotifier {
  var _score = 0;
  var _currentValue = _random();

  int get getScore => _score;
  int get getCurrentValue => _currentValue;

  static int _random() => Random().nextInt(100) + 1;

  void addPoints(int pts) {
    _score += pts;
    _currentValue = _random();

    notifyListeners();
  }
}
