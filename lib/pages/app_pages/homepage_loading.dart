import 'package:flutter/material.dart';

class HomePageLoadingScreen extends StatelessWidget {
  final String loadingMessage;

  const HomePageLoadingScreen({Key key,@required this.loadingMessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context);
    // bool _desktop = PlatformCheck.isDesktop(context);
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
                padding: EdgeInsets.symmetric(vertical: 60.0),
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
              SizedBox(height: 100),
              Text(loadingMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
