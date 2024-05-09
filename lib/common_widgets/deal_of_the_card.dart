import 'dart:async';

import 'package:assignment/common_widgets/helper_widgets.dart';
import 'package:assignment/generated/l10n.dart';
import 'package:flutter/material.dart';

class DealOfTheCard extends StatefulWidget {
  const DealOfTheCard({super.key});

  @override
  DealOfTheCardState createState() => DealOfTheCardState();
}

class DealOfTheCardState extends State<DealOfTheCard> {
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = _currentTime;
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);
    Duration timeRemaining = endOfDay.difference(now);

    int hours = timeRemaining.inHours;
    int minutes = timeRemaining.inMinutes.remainder(60);
    int seconds = timeRemaining.inSeconds.remainder(60);

    return moreProductCard(
        context,
        S.of(context).dealOfTheDay,
        '${hours}h ${minutes}m ${seconds}s remaining',
        Theme.of(context).colorScheme.secondary,
        Icons.alarm);
  }
}
