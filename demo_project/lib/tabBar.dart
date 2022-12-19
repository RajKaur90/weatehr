import 'package:flutter/material.dart';

class Tab_Bar extends StatefulWidget {
  const Tab_Bar({Key? key}) : super(key: key);

  @override
  State<Tab_Bar> createState() => _Tab_BarState();
}

class _Tab_BarState extends State<Tab_Bar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
      appBar: AppBar(title: Text("Tab Bar Demo"),
      bottom:TabBar(
        tabs: <Widget>[
                Tab(
          icon: Icon(Icons.cloud_outlined),
        ),
        Tab(
          icon: Icon(Icons.beach_access_sharp),
        ),
        Tab(
          icon: Icon(Icons.brightness_5_sharp),
        ),
      ],),),
      body: TabBarView(children: [
        Center(child: Icon(Icons.cloud,size: 300,),
        ),
        Center(child: Text("It's pouring outside",
          style: TextStyle(fontSize: 30),),),

        Center(child:  Icon(Icons.sunny,size: 300,),),
      ],),
    ));
  }
}
