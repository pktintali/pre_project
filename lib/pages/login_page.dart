import 'package:flutter/material.dart';
import 'package:pre_project/index.dart';
import 'package:pre_project/pages/singup.dart';
import 'package:pre_project/utils/platform_checker.dart';

class LoginPage extends StatelessWidget {
  static const routename = '/login';
  String _userEmail;
  String _password;
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context);
    bool _desktop = PlatformCheck.isDesktop(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topCenter,
        width: mdq.size.width,
        height: mdq.size.height,
        color: Colors.green,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
              ),
              IconTheme(
                data: IconThemeData(),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/dsc_logo.jpg"), //,
                  //backgroundColor: Colors.white,
                  radius: 60.0,
                ),
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              Text(
                "Vocal for Local",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              Padding(padding: EdgeInsets.all(2.0)),
              Text(
                "Enter your details here",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Form(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0)),
                    Padding(
                      padding: _desktop
                          ? EdgeInsets.symmetric(horizontal: 500)
                          : EdgeInsets.all(4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.0),
                            prefixIcon: Icon(Icons.email_rounded),
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (v) {
                            _userEmail = v;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: _desktop
                          ? EdgeInsets.symmetric(horizontal: 500)
                          : EdgeInsets.all(4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(2.0),
                            prefixIcon: Icon(Icons.vpn_key),
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                          ),
                          obscureText: true,
                          onChanged: (v) {
                            _password = v;
                          },
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.center,
                      child: OutlinedButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          print('Masssssssssssss');
                          // if (_userEmail != null && _password != null) {
                          context
                              .read<AuthManager>()
                              .login(email: _userEmail, password: _password);
                        },
                        // },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              OutlinedButton(
                child: Text(
                  "  New here ? Sign Up  ",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUp.routename);
                },
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              TextButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, MainHomePage.id);
                },
                child: Text(
                  "Forgot Password ? Need help ",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
