import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool timerStarted = false;
double currentTime = 60;

class pomoTimer extends StatefulWidget {
  const pomoTimer({super.key});

  @override
  State<pomoTimer> createState() => _pomoTimerState();
}

class _pomoTimerState extends State<pomoTimer> {
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
        title: const Text("Timer"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Minutes",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: kDefaultIconLightColor,
                ),
                border: OutlineInputBorder(
                  // Add border
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: kDefaultIconLightColor, // You can change the color
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  // Add focused border
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: kDefaultIconLightColor, // You can change the color
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  // Add enabled border
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: kDefaultIconLightColor.withOpacity(
                        0.5), // You can change the color and opacity
                    width: 1.0,
                  ),
                ),
              ),
              style: TextStyle(
                color: kDefaultIconLightColor,
              ),
              onSubmitted: (value) {
                setState(() {
                  currentTime = double.tryParse(value)! * 60;
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "${(currentTime / 60).floor()}:${(currentTime % 60).round()}",
            style: TextStyle(fontSize: 45),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 10 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "10", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 20 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "20", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 30 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "30", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 40 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "40", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 50 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "50", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentTime = 60 * 60;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100], // Light red color
                      padding: EdgeInsets.all(20), // Adjust padding as needed
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "60", // Text displayed on the button
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn3",
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
    if (currentTime <= 0.5) {
      stopTimer();
    }
  }

  void handleTimeout() {
    setState(() {
      timerStarted = true;
      currentTime -= 0.05;
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
