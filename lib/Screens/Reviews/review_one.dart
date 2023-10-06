import 'package:flutter/material.dart';

class ReviewOne extends StatefulWidget {
  const ReviewOne({super.key});

  @override
  State<ReviewOne> createState() => _ReviewOneState();
}

class _ReviewOneState extends State<ReviewOne> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.sizeOf(context).height,
                    ),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
