import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamatar/Shared/styleSheet.dart';
import 'package:tamatar/Widgets/pomodoro.dart';

double studyTime = 10 - 1;
double restTime = 5 - 1;
double currentActiveTime = studyTime;
int numberOfSessons = 4;
int currentSesson = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool timerStarted = false;
  bool study = true;
  bool rest = false;
  double currentTime = 0;
  double percentComplete = 0; // goes from 0 to 1
  List<Widget> marks = List.generate(numberOfSessons, (index) {
    return const Icon(
      Icons.star,
      color: Colors.grey,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "POMODORO TIMER",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      //body starts here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PomodoroFeild(),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: SizedBox(
                    height: getWidth(context, 600) / 2,
                    width: getWidth(context, 600) / 2,
                    child: CircularProgressIndicator(
                      backgroundColor: kcolor3,
                      color: Colors.green,
                      strokeWidth: 15,
                      value: percentComplete,
                      strokeCap: StrokeCap.round,
                      semanticsValue: currentTime.ceil().toString(),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      currentTime.ceil().toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                    Text(
                      (study) ? "Focus!" : "Rest Buddy!",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 0, 100, 120),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: kcolor3,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: marks,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (timerStarted == false) startTimer();
              if (timerStarted == true) stopTimer();
            },
            child: timerStarted
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                currentTime = 0;
                percentComplete = 0;
              });
            },
            child: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.add_business_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.timer),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.alarm),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  late var pomo;
  void startTimer() {
    pomo = Timer(const Duration(milliseconds: 50), handleTimeout);
    if (currentTime >= currentActiveTime && currentActiveTime != restTime) {
      currentTime = 0;
      percentComplete = 0;
      timerStarted = true;
      currentActiveTime = restTime;
      study = false;
    } else if (currentTime >= currentActiveTime &&
        currentActiveTime == restTime) {
      pomo.cancel();
      currentTime = 0;
      percentComplete = 0;
      timerStarted = false;
      currentActiveTime = studyTime;
      study = true;
      addMark();
    }
  }

  void handleTimeout() {
    setState(() {
      timerStarted = true;
      currentTime += 0.05;
      percentComplete = currentTime / currentActiveTime;
      startTimer();
    });
  }

  void stopTimer() {
    pomo.cancel();
    setState(() {
      timerStarted = false;
    });
  }

  void addMark() {
    if (currentSesson < numberOfSessons) {
      marks[currentSesson] = const Icon(Icons.star, color: Colors.amber);
    } else {
      marks.add(const Icon(Icons.star, color: Colors.amber));
    }
    currentSesson++;
  }
}
