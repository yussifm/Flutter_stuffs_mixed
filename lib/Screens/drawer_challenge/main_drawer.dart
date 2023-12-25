import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/drawer_challenge/custom_drawer.dart';
import 'package:maths_tuto_flutter/Screens/drawer_challenge/custome_guitar_drawer.dart';

class MainDrawerScreen extends StatefulWidget {
  final bool flip;
  const MainDrawerScreen({super.key, required this.flip});

  @override
  State<MainDrawerScreen> createState() => _MainDrawerScreenState();
}

class _MainDrawerScreenState extends State<MainDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = widget.flip
        ? AppBar()
        : AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => CustomDrawer.of(context)!.open(),
                );
              },
            ),
            title: const Text('Hello Flutter'),
          );
    Widget child = MyHomePage(appBar: appBar);
    if (widget.flip) {
      child = CustomGuitarDrawer(child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  const MyHomePage({key, required this.appBar}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
