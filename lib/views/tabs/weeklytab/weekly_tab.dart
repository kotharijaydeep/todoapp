import 'package:flutter/material.dart';

import 'calendar.dart';


class WeeklyTab extends StatefulWidget {
  const WeeklyTab({Key? key}) : super(key: key);

  @override
  _WeeklyTabState createState() => _WeeklyTabState();
}

class _WeeklyTabState extends State<WeeklyTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: Calenderr()),
      ],
    );
  }
}