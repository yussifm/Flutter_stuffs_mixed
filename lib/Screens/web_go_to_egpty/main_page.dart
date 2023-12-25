// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:math' show pi;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:maths_tuto_flutter/Screens/web_go_to_egpty/entrace_fader.dart';

class MyMainHomePage extends StatefulWidget {
  MyMainHomePage({key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color backgroundColor = const Color.fromRGBO(216, 177, 136, 1);
Color darkerColor = const Color.fromRGBO(200, 162, 122, 1);

class _MyHomePageState extends State<MyMainHomePage> {
  late ScrollController _scrollController;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get offset =>
      _scrollController.hasClients ? _scrollController.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -0.3 * offset,
            left: 0,
            right: 0,
            height: screenHeight,
            child: RepaintBoundary(
              child: Image.asset(
                kIsWeb ? "images/sky.png" : 'assets/images/sky.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0.2 * screenHeight,
            left: 0,
            right: 0,
            child: const MainText(),
          ),
          Positioned(
            top: screenHeight * 0.55 - 0.65 * offset,
            right: 0,
            left: 0,
            height: screenHeight * 0.4,
            child: RepaintBoundary(
              child: Image.asset(
                kIsWeb ? "images/pyramid.png" : 'assets/images/pyramid.png',
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.2),
              ),
            ),
          ),
          const Header(),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight / 3,
            child: RepaintBoundary(
              child: Image.asset(
                kIsWeb ? "images/sand.png" : 'assets/images/sand.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.8 - 1 * offset,
            left: 0,
            right: 0,
            height: screenHeight * 0.2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 1],
                  colors: [backgroundColor.withOpacity(0), backgroundColor],
                ),
              ),
            ),
          ),
//
          Scrollbar(
            child: ListView(
              cacheExtent: 64,
              controller: _scrollController,
              children: <Widget>[
                Container(height: screenHeight),
                Container(
                  height: 100,
                  color: backgroundColor,
                ),
                Container(
                  color: backgroundColor,
                  child: const Page1(),
                ),
                const Page2(),
                const Page3(),
                Container(
                  height: 100,
                  color: darkerColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Row(
        children: <Widget>[
          const Text('GOTOEGYPT'),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 900) ...[
            const Text('Home'),
            const SizedBox(width: 32),
            const Text('Explore'),
            const SizedBox(width: 32),
            const Text('Articles'),
            const SizedBox(width: 32),
            const Text('Gallies'),
            const SizedBox(width: 32),
            const Text('Contact'),
            const SizedBox(width: 64),
          ],
          Icon(
            Icons.apps,
            color: backgroundColor,
            size: 32,
          ),
        ],
      ),
    );
  }
}

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'THE ANCIENT WORLD',
          style: TextStyle(color: backgroundColor),
        ),
        const SizedBox(height: 16),
        Container(
          height: 1,
          width: 64,
          color: backgroundColor,
        ),
        const SizedBox(height: 32),
        Text(
          'Discover the awe-inspiring\nPyramids of Faze and ancient Egypt\'s',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide > 400 ? 60 : 40,
          ),
        ),
        const SizedBox(height: 32),
        const RotatedBox(
          quarterTurns: 2,
          child: Icon(LineIcons.angleDoubleUp, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Text('SCROLL DOWN', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Column(
        children: <Widget>[
          const Text(
            'THE ANCIENT',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Egyptian',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                ' civilization',
                style: TextStyle(color: Colors.black, fontSize: 30),
              )
            ],
          ),
          SizedBox(height: height * 0.1),
          if (width > 440)
            const Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of years. But what was its lasting impact?',
                  ),
                ),
                SizedBox(width: 64),
                Expanded(
                  child: Text(
                    'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
                  ),
                )
              ],
            )
          else ...[
            const Text(
              'The ancient Egyptian civilization, famous for its pyramids, pharaohs, mummies, and tombs, flourished for thousands for thousands of years. But what was its lasting impact?',
            ),
            const SizedBox(height: 16),
            const Text(
              'Watch the video below to learn how ancient Egypt contributed to modern-day society with its many cultural developments, particularly in language & mathematics',
            )
          ],
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: backgroundColor,
      height: height > width ? height * 0.5 : height * 0.8,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            bottom: height * 0.4,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: EntranceFader(
                offset: Offset(width / 4, 0),
                duration: const Duration(seconds: 1),
                child: Text(
                  'CIVILIZATION',
                  style: TextStyle(
                    color: darkerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: height * 0.4,
            child: Container(
              color: darkerColor,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: EntranceFader(
              offset: Offset(0, height * 0.4),
              duration: const Duration(seconds: 1),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    kIsWeb ? "images/camel.png" : 'assets/images/camel.png',
                    fit: BoxFit.fitWidth,
                  ),
                  const Icon(
                    Icons.play_circle_outline,
                    size: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        if (mounted) _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: darkerColor,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            const Text('10 THINGS', style: TextStyle(color: Colors.black)),
            SizedBox(height: height * 0.05),
            _header(),
            SizedBox(height: height * 0.1),
            if (width > height)
              Row(
                children: <Widget>[
                  Expanded(child: _leftSide(width)),
                  SizedBox(width: width * 0.1),
                  Expanded(child: _rightSide(height, width))
                ],
              )
            else ...[
              _leftSide(width),
              _rightSide(height, width),
            ],
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  RichText _header() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontFamily: 'IbarraRealNova',
        ),
        children: [
          TextSpan(
            text: 'You probably didn\'t know\n',
          ),
          TextSpan(
            text: 'about ',
          ),
          TextSpan(
            text: 'ancient Egypt',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'IbarraRealNova',
            ),
          )
        ],
      ),
    );
  }

  Widget _rightSide(double height, double width) {
    return EntranceFader(
      offset: Offset(width / 2, 0),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(seconds: 1),
      child: SizedBox(
        height: height / 2,
        child: Stack(
          alignment: const Alignment(0, 0.5),
          children: <Widget>[
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return Transform.rotate(
                  angle: _animationController.value * 0.5 * pi - pi * 0.7,
                  child: Container(
                    width: 360,
                    height: 360,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                );
              },
            ),
            Image.asset(
                kIsWeb ? "images/pharaon.png" : 'assets/images/pharaon.png'),
          ],
        ),
      ),
    );
  }

  Widget _leftSide(double width) {
    return EntranceFader(
      offset: Offset(-width / 2, 0),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(seconds: 1),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'His original name was\nNot Tutankhamun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Tutankhamun was originally named Tutanhaten. This name, which literally means "living image of the Aten", reflected the fact that Tutankhaten\'s parents worshipped a sun god known as "the Aten". After a few years on the throne the young king.',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 32),
          Text(
            'Read More',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
