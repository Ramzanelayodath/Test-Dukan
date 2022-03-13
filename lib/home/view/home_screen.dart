

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  String userName;

  HomeScreen(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Home",style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child:  Text('Hey '+userName,style: const TextStyle(color: Colors.black,fontSize: 20),),
        ),
      ),
    );
  }
}