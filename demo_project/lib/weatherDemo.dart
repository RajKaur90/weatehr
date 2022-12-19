import 'dart:convert';
import 'package:demo_project/tempDemo.dart';
import 'package:demo_project/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherDemo extends StatefulWidget {
  const WeatherDemo({Key? key}) : super(key: key);

  @override
  State<WeatherDemo> createState() => _WeatherDemoState();
}

class _WeatherDemoState extends State<WeatherDemo> {
  late AnimationController controller;
  WeatherModel model = WeatherModel();
  bool isLoading = true;
  String weatherIconUrl = "https://openweathermap.org/img/wn/";
  String searchText = "delhi";
  String baseUrl = "https://api.openweathermap.org/data/2.5/forecast?q=";
  String appId = "&appid=3f257c93e1b3e37ba779e3e52ca40ccc&units=metric";

  getWeather() async {
    final response = await http.get(Uri.parse(baseUrl + searchText + appId));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      model = WeatherModel.fromJson(responseData);
      isLoading = false;
      setState(() {});
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
          title: Center(child: Text("Temperature Information")),
        ),
        body: Container(width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey, Colors.white])),
          child: isLoading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    strokeWidth: 8,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(width: MediaQuery.of(context).size.width/1.5,
                            height: 40,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v){
                                setState(() {
                                  searchText=v;
                                });
                              },
                              // onFieldSubmitted: (v) {
                              //   searchText = v;
                              //   getWeather();
                              // },
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 40,
                            color: Colors.blue,
                            child: TextButton(
                                onPressed: () {
                                  getWeather();
                                },
                                child: Text(
                                  "Search",
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      ),
                      Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: model.list!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    decoration: BoxDecoration(boxShadow: [
                                      new BoxShadow(
                                        color: Colors.blue.withOpacity(0.2),
                                      )
                                    ], borderRadius: BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          weatherIconUrl +
                                              model.list![index].weather![0]
                                                  .icon! +
                                              ".png",
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.sunny, size: 40),
                                            Text(
                                              "Max ${model.list![index].main!.tempMax}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.sunny_snowing,
                                                size: 40,
                                              ),
                                              Text(
                                                  "Min ${model.list![index].main!.tempMin}",
                                                  style: TextStyle(fontSize: 22)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.heat_pump,
                                                size: 30,
                                              ),
                                              Text(
                                                "Humidity ${model.list![index].main!.humidity}",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.date_range,
                                                size: 30,
                                              ),
                                              Text(
                                                " ${model.list![index].dtTxt}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.blueAccent),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ))
                    ],
                  ),
                ),
        ));
  }
}
