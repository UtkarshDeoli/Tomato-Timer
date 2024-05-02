import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool timerStarted = false;
double currentTime = 0;

class stopWatch extends StatefulWidget {
  const stopWatch({super.key});

  @override
  State<stopWatch> createState() => _stopWatchState();
}

class _stopWatchState extends State<stopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (timerStarted) {
                stopTimer();
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Stop Watch"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currentTime.floor()}",
              style: TextStyle(fontSize: 45),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
              child: Text(
                ":${((currentTime - (currentTime.floor())) * 10).floor()}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn4",
        onPressed: () {
          if (timerStarted == false) startTimer();
          if (timerStarted == true) stopTimer();
        },
        child: timerStarted
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
      ),
    );
  }

  late var pomo;
  void startTimer() {
    pomo = Timer(const Duration(milliseconds: 50), handleTimeout);
  }

  void handleTimeout() {
    setState(() {
      timerStarted = true;
      currentTime += 0.05;
      startTimer();
    });
  }

  void stopTimer() {
    pomo.cancel();
    setState(() {
      timerStarted = false;
    });
  }
}
