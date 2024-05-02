import 'package:flutter/material.dart';
import '../Shared/style_sheet.dart';
import '../Pages/pomo_maker.dart';

class PomodoroFeild extends StatefulWidget {
  const PomodoroFeild({super.key});

  @override
  State<PomodoroFeild> createState() => _PomodoroFeildState();
}

class _PomodoroFeildState extends State<PomodoroFeild> {
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
              child: Text("Name of the task"),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  _openPomoMaker(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPomoMaker(BuildContext context) async {
    final data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PomoMakerPage()),
    );
    if (!context.mounted) return;
  }
}
