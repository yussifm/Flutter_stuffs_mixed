import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/v4.dart';
import 'package:uuid/v5.dart';

class InherStateMainScreen extends StatefulWidget {
  const InherStateMainScreen({super.key});

  @override
  State<InherStateMainScreen> createState() => _InherStateMainScreenState();
}

class _InherStateMainScreenState extends State<InherStateMainScreen> {
  ValueKey _textKey = const ValueKey<String?>(null);

  String bodyText = "Tap the screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Widgets"),
      ),
      body: GestureDetector(
        onTap: () async {
          final api = ApiProvider.of(context)?.api;

          final dateAndTime = await api?.getDateAndTime();

          setState(() {
            _textKey = ValueKey(dateAndTime);
            bodyText = dateAndTime ?? DateTime.now().toIso8601String();
          });
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(bodyText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context)?.api;

    return Text(api?.dateAndTime ?? "Tap on Screen to fetch date and time");
  }
}

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required Widget child,
    required this.api,
  })  : uuid = const UuidV4().generate(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) {
    return uuid != oldWidget.uuid;
  }

  static ApiProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApiProvider>();
  }
}

class Api {
  String? dateAndTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => DateTime.now().toIso8601String(),
    ).then((value) {
      dateAndTime = value;

      return value;
    });
  }
}
