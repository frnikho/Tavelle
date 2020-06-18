import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/rebuild/models/beauf_sentence.dart';
import 'package:tavelle/utils/colors.dart';

class Result extends StatelessWidget {

  static String id = "result_screen";

  @override
  Widget build(BuildContext context) {
    double result = Provider.of<UserData>(context).getAlcohol();
    double soberTime = Provider.of<UserData>(context).getTimeWhenUserIsSober(result, Provider.of<UserData>(context).getGender);
    TimeOfDay currentTime = TimeOfDay.now();
    bool tomorrow = false;
    double soberHour = soberTime / 60 + currentTime.hour;
    double soberMinute = soberTime % 60 + currentTime.minute;

    if (soberMinute > 60) {
      soberHour+=1;
      soberMinute-=60;
    }
    if (soberHour > 24) {
      soberHour -= 24;
      tomorrow = true;
    }

    bool good = result < 0.5;

    return Scaffold(
      backgroundColor: good ? primaryColor : Colors.redAccent,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(
                        color: good ? primaryColor : Colors.redAccent,
                        fontSize: 42,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    Text(' g/L',
                      style: TextStyle(
                        color: good ? primaryColor : Colors.redAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        textBaseline: TextBaseline.alphabetic
                      ),
                    ),
                  ],
                ),
              ),
              Text('"${getRandomResultSentence()}"', style: TextStyle(
                color: good ? primaryColor : Colors.redAccent,
                fontStyle: FontStyle.italic,
                fontSize: 24
              ),
              textAlign: TextAlign.center,),
              Text('tu seras sobre dans ${soberTime ~/ 60} heures et ${(soberTime % 60).toInt()} minutes'),
              Text('à ${soberHour.toStringAsFixed(0)}:${soberMinute.toStringAsFixed(0)}'),
              LottieBuilder.asset("animations/car.json", repeat: true),
              Text(getDriveSentence(result),
                style:
                  TextStyle(
                    color: good ? primaryColor : Colors.redAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    letterSpacing: 1.2,
                  ),
                textAlign: TextAlign.center
              ),
            ],
          ),
        ),
      ),
    );
  }
}
