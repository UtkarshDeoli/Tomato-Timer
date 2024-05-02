import 'package:flutter/material.dart';

class PomoMakerPage extends StatefulWidget {
  @override
  _PomoMakerPageState createState() => _PomoMakerPageState();
}

class _PomoMakerPageState extends State<PomoMakerPage> {
  List<dynamic> data = ["New Task", 100.0, 25.0, 1.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomo Maker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: 800,
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: "New Task",
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: kDefaultIconLightColor,
                      )),
                  style: TextStyle(
                    color: kDefaultIconLightColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      data[0] = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Study Time: ${data[1].toInt()} minutes',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: data[1],
                  min: 20,
                  max: 180,
                  divisions: 32,
                  onChanged: (value) {
                    setState(() {
                      data[1] = value;
                    });
                  },
                ),
                Text(
                  'Rest Time: ${data[2].toInt()} minutes',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: data[2],
                  min: 5,
                  max: 45,
                  divisions: 8,
                  onChanged: (value) {
                    setState(() {
                      data[2] = value;
                    });
                  },
                ),
                Text(
                  'No of Sessions: ${data[3].toInt()}',
                  style: TextStyle(fontSize: 18),
                ),
                Slider(
                  value: data[3],
                  min: 1,
                  max: 10,
                  divisions: 9,
                  onChanged: (value) {
                    setState(() {
                      data[3] = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, data);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
