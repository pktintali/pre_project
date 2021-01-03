import 'package:flutter/material.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
        centerTitle: true,
        leading: Container(),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return index == 19 ? SizedBox(height: 30) : alerTtile();
        },
      ),
    );
  }

  Widget alerTtile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('23 Dec'),
            // Icon(Icons.star_outline),
          ],
        ),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'D',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        title: Text('Demo Notification'),
        subtitle: Text('This is example demo notification description'),
        // tileColor: Colors.lightGreenAccent,
        onTap: () {},
      ),
    );
  }
}
