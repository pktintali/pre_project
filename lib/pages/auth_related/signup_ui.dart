import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/Providers/utils_provider/AuthFields.dart';
import 'package:pre_project/auth/auth_manager.dart';
import 'package:pre_project/firebase/firebase.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:provider/provider.dart';

class SignUpUI extends StatelessWidget {
  final AuthField authField;

  const SignUpUI({Key key, this.authField}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _desktop = PlatformCheck.isDesktop(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
            ),
            IconTheme(
              data: IconThemeData(),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dsc_logo.jpg"),
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
                //fontFamily: 'MarckScript',
              ),
            ),
            Padding(padding: EdgeInsets.all(2.0)),
            Text(
              "Enter your details here",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
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
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full Name',
                    hintText: 'Enter Your Full Name',
                  ),
                  onChanged: (v) {
                    authField.name = v;
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
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (v) {
                    authField.email = v;
                  },
                ),
              ),
            ),

            // Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
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
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Mobile Number',
                    hintText: 'Enter Your mobile No.',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    authField.mobileNo = v;
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
                child: TextFormField(
                  initialValue: authField.address ?? '',
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(2.0),
                    prefixIcon: Icon(Icons.location_history),
                    labelText: 'Address',
                    hintText: 'Enter Your Full Address',
                  ),
                  onChanged: (v) {
                    authField.address = v;
                  },
                ),
              ),
            ),
            // Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
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
                    authField.updatePassword(v);
                  },
                ),
              ),
            ),
            authField.password != null && authField.password.length < 6
                ? Text(
                    "Password must contain at least 6 characters",
                    style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                : SizedBox(),
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
                    prefixIcon: Icon(Icons.vpn_key_sharp),
                    labelText: 'Confirm Password',
                    hintText: 'Re-Enter your password',
                  ),
                  obscureText: true,
                  onChanged: (v) {
                    authField.rePassword = v;
                  },
                ),
              ),
            ),

            Padding(
              padding: _desktop
                  ? EdgeInsets.symmetric(horizontal: 500, vertical: 15)
                  : EdgeInsets.all(4.0),
              child: Text('Create Seller Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),

            CupertinoSwitch(
              value: authField.isSeller,
              activeColor: Colors.yellow,
              trackColor: Colors.grey,
              onChanged: (v) {
                authField.toogleSeller();
              },
            ),
            Padding(
              padding: _desktop
                  ? EdgeInsets.symmetric(horizontal: 500, vertical: 20.0)
                  : EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        print(authField.name);
                        print(authField.address);
                        if (authField.email != null &&
                            authField.password != null &&
                            authField.password == authField.rePassword) {
                          context
                              .read<AuthManager>()
                              .signUp(
                                  email: authField.email,
                                  password: authField.password)
                              .then((value) => FirebaseWork().addUser(
                                  name: authField.name,
                                  email: authField.email,
                                  mobileNo: authField.mobileNo,
                                  address: authField.address,
                                  gp: authField.geop ?? GeoPoint(0, 0),
                                  isSeller: authField.isSeller));
                          Navigator.pop(context);
                          // authField.reset();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Existing User ? Sign in",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
