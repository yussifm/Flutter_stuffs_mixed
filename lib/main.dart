import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/main_game.dart';
import 'package:maths_tuto_flutter/Screens/Reviews/review_one.dart';
import 'package:maths_tuto_flutter/Screens/adaptaive_UI/mediaq_screen.dart';
import 'package:maths_tuto_flutter/Screens/drawer_challenge/main_drawer.dart';
import 'package:maths_tuto_flutter/Screens/ffi_dart_exam/ffi_main_dart.dart';
import 'package:maths_tuto_flutter/Screens/fl_refers/dragger_flutter.dart';
import 'package:maths_tuto_flutter/Screens/fl_refers/game_score.dart';
import 'package:maths_tuto_flutter/Screens/flight_page_example/main_flight.dart';
import 'package:maths_tuto_flutter/Screens/media_tuto/video_compr_tuto.dart';
import 'package:maths_tuto_flutter/Screens/render_objects/main._rander_obj.dart';
import 'package:maths_tuto_flutter/Screens/vectors/vertors_screen.dart';
import 'package:maths_tuto_flutter/state_man_tuto/main_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/vandard_dart/vandard_dart.screen.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, child) {
        return ScreenUtilInit(
            designSize: const Size(400, 1000),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Flutter Maths',
                debugShowCheckedModeBanner: false,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: const MyHomePage(title: 'Practical Maths'),
              );
            });
      },
      providers: [Provider<GameScore>(create: (context) => GameScore())],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
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
                      builder: (context) => const VectorsScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Vectors",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VandardDartScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Dart By vandard",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainGame(),
                    ),
                  );
                },
                child: const Text(
                  "Games with Flutter",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainRenderObject(),
                    ),
                  );
                },
                child: const Text(
                  "Render Object with Flutter",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FFIDemo(),
                    ),
                  );
                },
                child: const Text(
                  "Foreign Function Interface with Flutter",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewOne(),
                    ),
                  );
                },
                child: const Text(
                  "Code Review",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DraggableExample(),
                    ),
                  );
                },
                child: const Text(
                  "Draggable in flutter",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MediaQScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Adaptive UI in flutter",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VideoCompressTuto(),
                    ),
                  );
                },
                child: const Text(
                  "Video Compress",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightsStepper(),
                    ),
                  );
                },
                child: const Text(
                  "Flights Stepper UI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainDrawerScreen(
                        flip: false,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Drawer Flipper UI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainDrawerScreen(
                        flip: true,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "3D Drawer Flipper UI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainStateScreen(),
                    ),
                  );
                },
                child: const Text(
                  "State Management",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
