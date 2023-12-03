import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateMain extends StatefulWidget {
  const IsolateMain({super.key});

  @override
  State<IsolateMain> createState() => _IsolateMainState();
}

class _IsolateMainState extends State<IsolateMain> {
  List<Person> person = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              final personData = await getPersons();
              setState(() {
                person = personData.toList();
              });
            },
            child: const Text("Get Data"),
          ),
          ...person.map(
            (e) => Row(
              children: [
                Text(e.name),
                Text("${e.age}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Person {
  String name;
  int age;
  Person({required this.name, required this.age});

  Person.fromJson(Map<String, dynamic> json)
      : name = json["name"] as String,
        age = json["age"] as int;
}

Future<Iterable<Person>> getPersons() async {
  final rP = ReceivePort();

  await Isolate.spawn(_getPerson, rP.sendPort);
  return await rP.first;
}

void _getPerson(SendPort sP) async {
  const String url = "http://127.0.0.1:5500/api/people1.json";
  final person = await HttpClient()
      .getUrl(
        Uri.parse(url),
      )
      .then(
        (value) => value.close(),
      )
      .then(
        (response) => response.transform(utf8.decoder).join(),
      )
      .then(
        (jsonStringData) => json.decode(jsonStringData) as List<dynamic>,
      )
      .then(
        (value) => value.map(
          (e) => Person.fromJson(e),
        ),
      );

  Isolate.exit(sP, person);

  // sP.send(person);
}
