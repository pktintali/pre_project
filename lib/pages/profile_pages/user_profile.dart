import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/data/MyUser.dart';

class UserProfile extends StatelessWidget {
  final UserData data;

  const UserProfile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyUser u = data.user;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundColor: Colors.green,
                  radius: MediaQuery.of(context).size.height * 0.09,
                  backgroundColor: Colors.yellow,
                  backgroundImage: AssetImage("assets/images/userimage.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Text(
                    u.name,
                    textScaleFactor: 1.4,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Username'),
              subtitle: Text(u.name),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Mobile No'),
              subtitle: Text(u.phones[0]),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Email'),
              subtitle: Text(u.phones[0]),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
