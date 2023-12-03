import 'package:flutter/material.dart';

class BirdWidget extends StatefulWidget {
  final double birdY;

  const BirdWidget({Key? key, required this.birdY}) : super(key: key);

  @override
  State<BirdWidget> createState() => _BirdWidgetState();
}

class _BirdWidgetState extends State<BirdWidget> {
 int frame = 1;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    int initialFrame = await changeImageByFrame();
    setState(() {
      frame = initialFrame;
    });
    while (true) {
      await Future.delayed(const Duration(milliseconds: 240));
      final newFrame = await changeImageByFrame();
      setState(() {
        frame = newFrame;
      });
    }
  }

  Future<int> changeImageByFrame() async {
    int newFrame = 1;
    setState(() {
      newFrame = frame == 1 ? 2 : 1;
    });
    return newFrame;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment(0, widget.birdY),
      child: Image.asset(
        "assets/images/frame-$frame.png",
        width: 60,
        height: 60,
      ),
    );
  }
}
