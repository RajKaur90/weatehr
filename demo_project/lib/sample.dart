import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
                color: Colors.grey,
              ),
              Container(
                height: MediaQuery.of(context).size.height/2,
               color: Colors.pinkAccent,),

            ],
          ),

          Positioned(top: 30,
              child: Image.asset("assets/images/google.png"),
          height: 700,)
        ],
      ),

    );
  }
}
