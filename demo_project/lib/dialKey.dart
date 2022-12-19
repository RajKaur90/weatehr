import 'package:flutter/material.dart';

class Dial_Key extends StatefulWidget {
  const Dial_Key({Key? key}) : super(key: key);

  @override
  State<Dial_Key> createState() => _Dial_KeyState();
}

class _Dial_KeyState extends State<Dial_Key> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("Table Chart")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Center(
              child: Text(
                "Table",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Table(
              textDirection: TextDirection.ltr,
              //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              //border: TableBorder.all(width: 1, color: Colors.black),
              border: TableBorder.lerp(
                  TableBorder(top: BorderSide(width: 2, color: Colors.red)),
                  TableBorder(
                      bottom: BorderSide(width: 4, color: Colors.green)),
                  0.5),
              children: [
                TableRow(decoration: BoxDecoration(color: Colors.grey),
                    children: [
                  Text(
                    "Education",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,
                  ),
                  Text("Institution name",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                  Text("University",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                ]),
                TableRow(children: [
                  Text(
                    "B.Tech",
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                  Text("B.I.S.",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                  Text("P.T.U.",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                ]),
                TableRow(children: [
                  Text("M.Tech",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                  Text("S.B.S.",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                  Text("L.P.U.",
                      textScaleFactor: 1.5, textAlign: TextAlign.center),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
