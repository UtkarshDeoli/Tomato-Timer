import 'package:flutter/material.dart';
import '../Shared/style_sheet.dart';

class PomodoroFeild extends StatefulWidget {
  const PomodoroFeild({super.key});

  @override
  State<PomodoroFeild> createState() => _PomodoroFeildState();
}

class _PomodoroFeildState extends State<PomodoroFeild> {
  @override
  Widget build(BuildContext context) {
    double studyTime = 60;
    double restTime = 0;
    return Padding(
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
            const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text("Name of the task"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: kbackgroundDark,
                          scrollable: true,
                          title: const Text('New Task'),
                          content: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Name of Task',
                                      icon: Icon(Icons.list),
                                    ),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Rest Time',
                                      icon: Icon(Icons.email),
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Message',
                                      icon: Icon(Icons.message),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: Text("Submit"),
                                onPressed: () {
                                  // your code
                                })
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
