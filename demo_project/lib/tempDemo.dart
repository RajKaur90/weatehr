import 'package:demo_project/humidityDemo.dart';
import 'package:demo_project/logInScreen.dart';
import 'package:demo_project/weatherDemo.dart';
import 'package:flutter/material.dart';

class TemperatureDemo extends StatefulWidget {
  const TemperatureDemo({Key? key}) : super(key: key);

  @override
  State<TemperatureDemo> createState() => _TemperatureDemoState();
}

class _TemperatureDemoState extends State<TemperatureDemo> {
 @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const LogInScreen())));
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Weather Record")),
      ),
      body: Center(
        child: Container(width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey, Colors.white])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/cloudy.png"),
                height: 300,
                width: 300,
              ),
              Text(
                "Welcome to Weather World",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WeatherDemo()));
                  },
                  child: Text("Weather"),
                  color: Colors.blueAccent,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
