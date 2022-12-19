import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class List_View extends StatefulWidget {
  const List_View({Key? key}) : super(key: key);

  @override
  State<List_View> createState() => _List_ViewState();
}

class _List_ViewState extends State<List_View> {

  double star =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("List View Builder"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                          child:Container(width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: Image(image: AssetImage("assets/images/flutter.png"),)
                          ),
                    ),
                  ),
                  RatingStars(
                    starCount: 5,
                    starSpacing:2 ,
                    starSize: 20,
                    maxValue: 5,
                    value: star,
                    onValueChanged: (val){
                      setState(() {
                        star=val;
                      });
                      print(" Star Rating $val");
                    },
                    maxValueVisibility: true,
                    valueLabelVisibility: true,
                    starColor: Colors.yellow,
                    starOffColor: const Color(0xffe7e8ea),
                    valueLabelColor: const Color(0x930C0CFF),
                  ),
                ],
              ),
            );

          }),
    );
  }
}
