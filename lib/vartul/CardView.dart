import 'package:flutter/material.dart';

class ImgCard extends StatelessWidget{

  
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/India.png'),
              fit: BoxFit.cover
          )
        ),
      ),
    );   
  }
}