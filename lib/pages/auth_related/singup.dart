import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/Providers/utils_provider/AuthFields.dart';
import 'package:pre_project/data/LocationData.dart';
import 'package:pre_project/pages/app_pages/homepage_loading.dart';
import 'package:pre_project/pages/auth_related/signup_ui.dart';
import 'package:pre_project/utils/get_location.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static const routename = '/signUp';

  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context);
    return Scaffold(
      body: Consumer<AuthField>(
        builder: (context, authField, __) => Container(
          color: Colors.green,
          width: mdq.size.width,
          height: mdq.size.height,
          alignment: Alignment.topCenter,
          //margin: EdgeInsets.all(8.0),
          child: authField.address == null
              ? FutureBuilder<LocationData>(
                  future: GetLocation.determinePosition(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      authField.address = snapshot.data.address;
                      final gp = snapshot.data.position;
                      authField.geop = GeoPoint(gp.latitude, gp.longitude);
                      return SignUpUI(
                        authField: authField,
                      );
                    }
                    if (snapshot.hasError) {
                      return SignUpUI(authField: authField);
                    } else {
                      return HomePageLoadingScreen(
                        loadingMessage: 'Getting Your Location...',
                      );
                    }
                    // print(snapshot.data.altitude);
                  })
              : SignUpUI(authField: authField),
        ),
      ),
    );
  }
}
