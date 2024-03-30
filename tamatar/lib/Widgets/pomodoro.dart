import 'package:flutter/material.dart';

import '../Shared/styleSheet.dart';

class PomodoroFeild extends StatelessWidget {
  const PomodoroFeild({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
