import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tamatar/Pages/pomo_maker.dart';
import 'package:tamatar/Shared/style_sheet.dart';
import 'package:tamatar/Widgets/pomodoro.dart';

double studyTime = 45 * 60;
double restTime = 15 * 60;
double currentActiveTime = studyTime;
int numberOfSessons = 4;
int currentSesson = 0;
String taskName = "No Name";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kcolor3,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 70,
                  width: getWidth(context, 700),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(taskName),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _openPomoMaker(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // end of Title pomodoro
              const SizedBox(
                height: 80,
              ),
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
                        (study)
                            ? ((studyTime - currentTime) < 60)
                                ? "${(studyTime - currentTime).ceil()} sec"
                                : "${((studyTime - currentTime) / 60).floor()}min"
                            : ((restTime - currentTime) < 60)
                                ? "${(restTime - currentTime).ceil()} sec"
                                : "${((restTime - currentTime) / 60).floor()}min ${((restTime - currentTime) % 60).floor()} sec",
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
              // end of dial
              const SizedBox(
                height: 50,
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
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              if (timerStarted == false) startTimer();
              if (timerStarted == true) stopTimer();
            },
            child: timerStarted
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            heroTag: "btn1",
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PomoMakerPage()),
                );
              },
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

  Future<void> _openPomoMaker(BuildContext context) async {
    final data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PomoMakerPage()),
    );
    if (!context.mounted) return;
    setState(() {
      taskName = data[0];
      studyTime = data[1] * 60;
      restTime = data[2] * 60;
      numberOfSessons = data[3].round();
      marks = List.generate(numberOfSessons, (index) {
        return const Icon(
          Icons.star,
          color: Colors.grey,
        );
      });
    });
  }
}
