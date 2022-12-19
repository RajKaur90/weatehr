import 'dart:convert';
import 'package:demo_project/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HumidityDemo extends StatefulWidget {
  const HumidityDemo({Key? key}) : super(key: key);

  @override
  State<HumidityDemo> createState() => _HumidityDemoState();
}

class _HumidityDemoState extends State<HumidityDemo> {

  WeatherModel model = WeatherModel();
  String searchText = "delhi";
  String baseUrl = "https://api.openweathermap.org/data/2.5/forecast?q=";
  String appId = "&appid=3f257c93e1b3e37ba779e3e52ca40ccc&units=metric";

  getWeather() async {
    final response = await http.get(Uri.parse(baseUrl + searchText + appId));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      model = WeatherModel.fromJson(responseData);

    } else {
      print("Server error");
    }
  }
  @override
  void initState() {
    getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Humidity Record")),),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (v) {
                  searchText = v;
                  getWeather();
                },
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: model.list!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black12.withOpacity(0.5),
                                    offset: new Offset(6.0, 6.0))
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Image(image: AssetImage("assets/images/cloudy.png"),height: 60,
                                  width: 60,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.heat_pump,
                                      size: 30,
                                    ),
                                    Text(
                                      "Humidity ${model.list![index].main!.humidity}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      size: 30,
                                    ),
                                    Text(
                                      " ${model.list![index].dtTxt}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
    );
  }
}
