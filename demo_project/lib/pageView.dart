import 'package:flutter/material.dart';

class Page_View extends StatefulWidget {
  const Page_View({Key? key}) : super(key: key);

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Page View Widget")),
      ),
      body: Container(color: Colors.brown,
        width: MediaQuery.of(context).size.width,

        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Page 1",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(width:400,
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/images/flutterlogo.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Page 2",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(width:400,
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/images/google.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Page 3",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(width:400,
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/images/flutterlogo.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Page 4",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(width:400,
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/images/google.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Page 5",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(width:400,
                      height: 400,
                      child: Image(
                        image: AssetImage("assets/images/flutterlogo.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
