import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/rebuild/screens/result.dart';
import 'package:tavelle/rebuild/widgets/drink_list_view.dart';
import 'package:tavelle/utils/colors.dart';

class DrinksScreen extends StatelessWidget {

  static String id = "drinks_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'beer_animation',
              child: CircleAvatar(
                  radius: 90,
                  backgroundColor: primaryColor,
                  child:
                  Lottie.asset("animations/beer_party.json", repeat: true)
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Drink",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w600)
                  ),
                  DrinkListView(),
                  Consumer<UserData>(
                    builder: (context, data, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              data.resetDrinks();
                            },
                            child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black.withOpacity(0.09),
                                child: FaIcon(Icons.refresh, color: primaryColor)),
                          ),
                          GestureDetector(
                            onTap: () {
                              data.addDrinks();
                            },
                            child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.black.withOpacity(0.09),
                                child: FaIcon(Icons.add, color: primaryColor)),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Result.id);
                    },
                    child: Text("NEXT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 30,
                            letterSpacing: 4,
                            fontWeight: FontWeight.w600)
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

