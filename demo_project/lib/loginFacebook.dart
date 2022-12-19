import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
class LogInFacebook extends StatefulWidget {
  const LogInFacebook({Key? key}) : super(key: key);

  @override
  State<LogInFacebook> createState() => _LogInFacebookState();
}

class _LogInFacebookState extends State<LogInFacebook> {

  final fb = FacebookLogin();

  logInfacebook() async {


    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        FacebookAccessToken accessToken = res.accessToken!;
        print("Acess token:{accessToken.token}");


        final profile = await
        fb.getUserProfile();
        print('Hello, ${profile!.name}! Your ID: ${profile.userId}');

        final imageUrl = await
        fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        final email = await
        fb.getUserEmail();
        if (email != null)
          print('Your email : $email');

        break;
      case FacebookLoginStatus.cancel:
        break;
      case FacebookLoginStatus.error:
        print('Error while Log In:${res.error}');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Facebook LogIn")),
        ),
        body: Center(
          child:Container(width: 100,

            child: MaterialButton(
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: (){
                logInfacebook();
              },
              child:Image(image: AssetImage("assets/images/facebook.png"),
              fit: BoxFit.cover,),
            ),
          )
         /* Container(width: 100,
            child: MaterialButton(
              color: Colors.white,
              elevation: 10,
              onPressed: () {
                logInfacebook();
              },
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.yellow,
                    //child: Image(image: AssetImage("assets/images/flutterlogo.jpg"),),
                  ),
                  Text("Log In")
                ],
              )
            ),
          ),*/
        )
    );
  }
}
