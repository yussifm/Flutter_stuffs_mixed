import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(
            height: 30.h,
          ),
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
