import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/bonfire_game_example/main_game_b1.dart';

class MainBonFireOne extends StatefulWidget {
  const MainBonFireOne({super.key});

  @override
  State<MainBonFireOne> createState() => _MainBonFireOneState();
}

class _MainBonFireOneState extends State<MainBonFireOne> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const RPGGameMain();
  }
}
