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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          width: mdq.size.width,
          height: mdq.size.height,
          color: Colors.green,
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
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(children: [
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: " Email",
                              hintText: " Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Icon(
                          Icons.email_sharp,
                        )
                      ]),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: " Password",
                                hintText: " Enter Password",
                              ),
                            ),
                          ),
                          Icon(Icons.archive_outlined),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 165,
                        child: RaisedButton(
                          child: Text(
                            'Sign in as User',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          color: Colors.yellow,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                      Container(
                        width: 165,
                        child: RaisedButton(
                          child: Text(
                            'Sign in as Vendor',
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
                ],
              )),
              Padding(padding: EdgeInsets.all(4.0)),
              OutlineButton(
                child: Text(
                  "  New User? Sign Up  ",
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
              Padding(padding: EdgeInsets.all(3.0)),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MainHomePage.id);
                  },
                  child: Text(
                    "Skip this step",
                    style: TextStyle(color: Colors.white70),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
