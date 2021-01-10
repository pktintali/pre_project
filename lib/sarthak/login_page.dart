import 'package:flutter/material.dart';
import 'package:pre_project/mainHomePage.dart';
import 'package:pre_project/sarthak/singup.dart';

class LoginPage extends StatelessWidget {
  static const routename = '/login';
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context);
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
                    Card(
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.0,
                            ),
                          ),
                          Icon(
                            Icons.email_sharp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.0,
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: " Email / Phone ",
                                hintText: " Email or Phone",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                            ),
                            Icon(Icons.archive_outlined),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.0,
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: " Password",
                                  hintText: " Password",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.center,
                      child: RaisedButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              OutlineButton(
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
                textColor: Colors.yellow,
              ),
              Padding(padding: EdgeInsets.all(4.0)),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MainHomePage.id);
                },
                child: Text(
                  "Forgot Password ? Need help ",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
              // Padding(padding: EdgeInsets.all(2.0)),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MainHomePage.id);
                },
                child: Text(
                  "Skip this step",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
