import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  final List<int> increaseHistory;

  const HistoryWidget({
    super.key,
    required this.increaseHistory,
  });

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Increases counter"),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text(widget.increaseHistory[index].toString());
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: widget.increaseHistory.length),
            ),
          ),
        ),
      ],
    );
  }
}
