import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:imageslider/pages/imagesliderscreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'com.facebook.FacebookSdk';
// import 'com.facebook.appevents.AppEventsLogger';

class mainscreen extends StatelessWidget {
  const mainscreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[800],
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Sign in with your facbeook Account",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ),
                    /* FlatButton.icon(
                      icon: Icons.face_book,
                      color: Colors.blue,
                      label: Text("Sign in with Facebook",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      onPressed: login,
                    ), */
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign up with Facebook",
                      onPressed: () {
                        _showButtonPressDialog(context, 'Facebook (mini)');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String provider) async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => imagesliderscreen()),
        );
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
