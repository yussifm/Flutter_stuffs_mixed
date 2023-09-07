import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppleVisionWidget extends StatefulWidget {
  const AppleVisionWidget({super.key});

  @override
  State<AppleVisionWidget> createState() => _AppleVisionWidgetState();
}

class _AppleVisionWidgetState extends State<AppleVisionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
            ),
            Container(
              width: 50,
              height: MediaQuery.of(context).size.height * 0.5,

              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: const Color(0xFF1c1c1e),
                ),
                color: const Color(0xFF636566).withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF636566).withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

              ],),
            ),
          ],
        ),
      ),
    );
  }
}
