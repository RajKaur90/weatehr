import 'dart:convert';

import 'package:demo_project/tempDemo.dart';
import 'package:demo_project/weatherDemo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey= GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

   loginApi(String email,String password) async {
    var response=await  http.post(
      Uri.parse('https://dietangel.shtibel.com/dietAngel/public/api/user/login_faster'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password':password
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);

     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const TemperatureDemo())));
      setState(() {});
    } else {
      print("Server error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Email LogIn")),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(image: AssetImage("assets/images/google-plus.png"),
                  height: 70,
                  width: 70,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: "Your Email",
                      hintText: "Enter your email",
                    ),
                    onSaved: (value){},
                    validator:(value){
                      if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!) ==
                          false){
                        return "valid email";
                      }
                      return null;
                    } ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Your Password",
                      hintText: "Enter your password",
                    ),
                    onSaved: (value){},
                    validator: (value){
                      if(value!.length==0)
                      {
                        return "Enter your valid password";
                      }
                      else if(value!.length<6)
                      {
                        return "Enter correct password";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/2 ,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState !.validate()) {
                            print("validate");
                            loginApi(email.text, password.text);
                          }
                          else {
                            print("not validate");
                          }
                        },
                        child: Text(
                          "LogIn",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
