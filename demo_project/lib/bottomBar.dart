import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Icon(
      Icons.call,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),

    Text(
      "Find Contact",
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.brown),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Center(child: Text('Bottom Navigation Bar')),
      ),
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        backgroundColor: Colors.black12,
        //elevation: 0,
        iconSize: 40,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amber),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        mouseCursor: SystemMouseCursors.grab,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        unselectedItemColor: Colors.deepOrangeAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats')
        ],
      ),
    );
  }
}
