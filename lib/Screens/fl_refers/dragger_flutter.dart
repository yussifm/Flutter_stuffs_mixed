import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/fl_refers/game_score.dart';
import 'package:provider/provider.dart';

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<GameScore>(
            builder: (context, value, child) {
              return Text("Total Score: ${value.getScore}");
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EvenContainer(),
              NumberContainer(),
              OddContainer(),
            ],
          )
        ],
      ),
    );
  }
}

class NumberContainer extends StatelessWidget {
  const NumberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScore>(
      builder: ((context, game, child) => Draggable(
            data: game.getCurrentValue,
            feedback: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.black26,
              ),
              child: Center(
                child: Text("${game.getCurrentValue}"),
              ),
            ),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text("${game.getCurrentValue}"),
              ),
            ),
          )),
    );
  }
}

class EvenContainer extends StatelessWidget with SnackMessage {
  const EvenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScore>(
      builder: ((context, game, child) => Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: DragTarget<int>(
              onAccept: (data) => _onAccept(context, data),
              onWillAccept: _willAccept,
              builder: (BuildContext context, List<Object?> candidateData,
                  List<dynamic> rejectedData) {
                return const Text("Even");
              },
            ),
          )),
    );
  }

  void _onAccept(BuildContext context, int data) {
    context.read<GameScore>().addPoints(data);
    showMessage(context, "Points: + $data");
  }

  bool _willAccept(int? data) => data != null && data % 2 == 0;
}

class OddContainer extends StatelessWidget with SnackMessage {
  const OddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScore>(
      builder: ((context, game, child) => Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.greenAccent,
            ),
            child: DragTarget<int>(
              onAccept: (data) => _onAccept(context, data),
              onWillAccept: _willAccept,
              builder: (BuildContext context, List<Object?> candidateData,
                  List<dynamic> rejectedData) {
                return const Text("Odd");
              },
            ),
          )),
    );
  }

  void _onAccept(BuildContext context, int data) {
    context.read<GameScore>().addPoints(data);
    showMessage(context, "Points: + $data");
  }

  bool _willAccept(int? data) => data != null && data % 2 == 0;
}

mixin SnackMessage {
  void showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 600),
    ));
  }
}
