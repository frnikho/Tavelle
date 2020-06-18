import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:tavelle/rebuild/models/beauf_sentence.dart';
import 'package:tavelle/rebuild/screens/gender_and_size.dart';
import 'package:tavelle/rebuild/widgets/about.dart';
import 'package:tavelle/utils/colors.dart';
import 'package:tavelle/utils/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String citationSentence = getRandomBeaufSentence();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  AboutApp().open(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Image.asset("images/cigar.png", width: 30))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Tavelle", style: kTitleHomeTextStyle),
                    SizedBox(width: 10),
                    Icon(FontAwesomeIcons.beer, color: Colors.white),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text('"$citationSentence"', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        citationSentence = getRandomBeaufSentence();
                      });
                    },
                    child: CircleAvatar(radius:20, backgroundColor: Colors.white, child: FaIcon(FontAwesomeIcons.sync, color: primaryColor, size: 10))),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, GenderAndSizeScreen.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 30),
                        Text(
                          "NEXT",
                          style: TextStyle(
                              fontSize: 30,
                              color: primaryColor,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
                        ),
                        Hero(
                          tag: 'beer_animation',
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: Lottie.asset("animations/beer_party.json", repeat: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
