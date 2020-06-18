import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/rebuild/screens/drinks.dart';
import 'package:tavelle/rebuild/screens/gender_and_size.dart';
import 'package:tavelle/rebuild/screens/result.dart';
import 'package:flutter/services.dart';

import 'rebuild/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider<UserData>(
      create: (context) {
        return UserData();
      },
      child: MaterialApp(
        routes: {
          GenderAndSizeScreen.id: (context) => GenderAndSizeScreen(),
          DrinksScreen.id: (context) => DrinksScreen(),
          Result.id: (context) => Result(),
        },
        home: Home(),
      ),
    );
  }
}