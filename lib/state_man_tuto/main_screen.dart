import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/state_man_tuto/basic_state.dart';

class MainStateScreen extends StatelessWidget {
  const MainStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("State Management"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasicStateManage(),
                ),
              );
            },
            child: const Text(
              "Basics ",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }
}
