import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maths_tuto_flutter/state_man_tuto/basic_state.dart';
import 'package:maths_tuto_flutter/state_man_tuto/chaptertwo_inheredwidgets/inher_main_screen.dart';

class MainStateScreen extends StatelessWidget {
  const MainStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ApiProvider(
      api: Api(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("State Management"),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                "Basics - Value Notifier",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InherStateMainScreen(),
                  ),
                );
              },
              child: const Text(
                "Inherited Widgets ",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
