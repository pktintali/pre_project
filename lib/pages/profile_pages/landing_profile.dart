import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/pages/profile_pages/user_profile.dart';
import 'package:pre_project/pages/profile_pages/vendor_profile.dart';
import 'package:provider/provider.dart';

class LandingProfile extends StatelessWidget {
  static const routename = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        // leading: Container(),
        // actions: [IconButton(icon: Icon(Icons.edit_rounded), onPressed: () {})],
      ),
      body: Consumer<UserData>(builder: (context, userData, __) {
        return userData.user.isVendor
            ? VendorProfile(
                data: userData,
              )
            : UserProfile(
                data: userData,
              );
      }),
    );
  }
}
