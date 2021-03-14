import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/index.dart';
import 'package:pre_project/pages/login_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersData');
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return Consumer<UserData>(builder: (context, userData, __) {
        return userData.user != null
            ? MainHomePage()
            : FutureBuilder<DocumentSnapshot>(
                future: users
                    .doc('${AuthManager(FirebaseAuth.instance).userEmail}')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data.data();
                    print("Full Name: ${data['name']} ${data['userID']}");
                    print(data['isVendor']);
                    print('ZZZZZZZZZ Adding User ZZZZZZZZZ');
                    MyUser u = new MyUser(
                        name: data['name'],
                        email: data['userID'],
                        isVendor: data['isVendor'] ?? false,
                        address: data['address'] ?? 'NAN',
                        about: data['about'] ?? 'NAN',
                        geoPoint: data['geopoint'],
                        phones: data['phones'] ?? 'NAN',
                        isUPI: data['isUPI'] ?? false,
                        language: data['language'] ?? 'NAN',
                        userID: data['userID'] ?? 'NAN',
                        vendorRating: data['vendorRating'] ?? 'NAN');
                    userData.updateUser(u);
                    return MainHomePage();
                  }
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                },
              );
      });
    }
    return LoginPage();
  }
}
