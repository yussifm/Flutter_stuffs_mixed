import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/vandard_dart/currency_dart/currency_in_dart.dart';
import 'package:maths_tuto_flutter/Screens/vandard_dart/isoletates/Isola_main.dart';
import 'package:maths_tuto_flutter/Screens/vandard_dart/streams_dart/example_one.dart';

class VandardDartScreen extends StatefulWidget {
  const VandardDartScreen({super.key});

  @override
  State<VandardDartScreen> createState() => _VandardDartScreenState();
}

class _VandardDartScreenState extends State<VandardDartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Topics',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExampleOne(),
                  ),
                );
              },
              child: const Text(
                "Example one",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IsolateMain(),
                  ),
                );
              },
              child: const Text(
                "Isolate in Dart",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrencyInDartVan(),
                  ),
                );
              },
              child: const Text(
                "ConCurrency in Dart",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
