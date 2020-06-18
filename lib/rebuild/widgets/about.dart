import 'package:flutter/material.dart';

class AboutApp {

  void open(context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(title: Text("abc"), content: Text("content"), actions: [Text("a"), Text('b')], );
    });
    //showAboutDialog(context: context, applicationIcon: Image.asset("images/icon.png", width: 40), applicationLegalese: "abc", applicationName: "Tavelle", applicationVersion: "release 1.0.0");
  }

}
