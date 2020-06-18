import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/rebuild/screens/drinks.dart';
import 'package:tavelle/utils/colors.dart';
import 'package:tavelle/utils/types.dart';

class GenderAndSizeScreen extends StatelessWidget {
  static String id = "gender_and_size";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'beer_animation',
              child: CircleAvatar(
                  radius: 90,
                  backgroundColor: primaryColor,
                  child:
                      Lottie.asset("animations/beer_party.json", repeat: true)),
            ),
          ),
          Consumer<UserData>(
            builder: (context, data, child) {
              return Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Genre",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              letterSpacing: 4,
                              fontWeight: FontWeight.w600)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              data.setGender(gender.male);
                            },
                            child: CircleAvatar(
                              child: FaIcon(FontAwesomeIcons.mars,
                                  color: primaryColor, size: 80),
                              backgroundColor: data.getGender == gender.male
                                  ? Colors.black.withOpacity(0.10)
                                  : Colors.transparent,
                              radius: 55,
                            ),
                          ),
                          GestureDetector(
                            child: CircleAvatar(
                              child: FaIcon(FontAwesomeIcons.female,
                                  color: primaryColor, size: 80),
                              radius: 55,
                              backgroundColor: data.getGender == gender.female
                                  ? Colors.black.withOpacity(0.10)
                                  : Colors.transparent,
                            ),
                            onTap: () {
                              data.setGender(gender.female);
                            },
                          ),
                        ],
                      ),
                      Text("Poids",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              letterSpacing: 4,
                              fontWeight: FontWeight.w600)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            '${data.getWeight.toInt()}',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(' kg',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  textBaseline: TextBaseline.alphabetic)),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(thumbColor: primaryColor, overlayColor: primaryColor, activeTrackColor: primaryColor, inactiveTrackColor: primaryColor.withOpacity(0.2)),
                        child: Slider(
                          value: data.getWeight,
                          min: 30,
                          max: 160,
                          onChanged: (value) {
                            data.setWeight(value);
                          },
                        ),
                      ),
                      Text("Taille",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              letterSpacing: 4,
                              fontWeight: FontWeight.w600)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            '${data.getHeight.toInt()}',
                            style: TextStyle(
                                fontSize: 30,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(' cm',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  textBaseline: TextBaseline.alphabetic)),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(thumbColor: primaryColor, overlayColor: primaryColor, activeTrackColor: primaryColor, inactiveTrackColor: primaryColor.withOpacity(0.2)),
                        child: Slider(
                          value: data.getHeight,
                          min: 120,
                          max: 240,
                          onChanged: (value) {
                            data.setHeight(value);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DrinksScreen.id);
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
