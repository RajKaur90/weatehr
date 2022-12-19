import 'package:flutter/material.dart';
class DrawerDemo extends StatefulWidget {
  const DrawerDemo({Key? key}) : super(key: key);

  @override
  State<DrawerDemo> createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Drawer Demo")),
      ),
      body: Center(
        child: Text("Drawer Invisible",style: TextStyle(fontSize: 35),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.cyan),
                  accountName: Text(
                    "Rajwinder Kaur",
                    style: TextStyle(fontSize: 15),
                  ),
                  accountEmail: Text("raj123@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      "R",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text("My Time"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("My Course"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium),
              title: Text("Go Premium"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
