import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  int num = 0;

  @override
  initState() {
    numbers();
    getValues();

    super.initState();
  }

  Stream<int> numbers({
    int start = 0,
    int end = 4,
    isIncluded? f,
  }) async* {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    for (int i = start; i < end; i++) {
      if (f == null || f(i)) {
        yield i;
      }
    }
  }

  getValues() async {
  await Future.delayed(
      const Duration(seconds: 3),
    );
    await for (int values in numbers()) {
      setState(() {
        num = values;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(num);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purpleAccent,
              ),
              child: Text("$num"),
            ),
          )
        ],
      ),
    );
  }
}

typedef isIncluded = bool Function(int value);
