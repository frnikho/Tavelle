import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tavelle/utils/types.dart';

List<DrinkType> kDrinks = [
  DrinkType(title: "Bière", data: 6),
  DrinkType(title: "Vin", data: 11),
  DrinkType(title: "Champagne", data: 20),
  DrinkType(title: "Wisky", data: 40),
  DrinkType(title: "Rhum", data: 38),
  DrinkType(title: "Vodka", data: 37.5),
  DrinkType(title: "Pastis", data: 40),
  DrinkType(title: "Gin", data: 37.5),
  DrinkType(title: "Tequila", data: 35),
];

List<DrinkType> kGlassSize = [
  DrinkType(title: "Shooter", data: 4),
  DrinkType(title: "Goblet", data: 20),
  DrinkType(title: "Beer pong", data: 55),
  DrinkType(title: "Flûte", data: 12.5),
  DrinkType(title: "Ballon", data: 15),
  DrinkType(title: "1/2", data: 25),
  DrinkType(title: "Cocktail", data: 13.3)
];

class DrinkType extends StatelessWidget{

  final String title;
  final double data;

  DrinkType({this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: TextAlign.center, style: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 15,
    ));
  }
}

class Drink {

  TimeOfDay time = TimeOfDay.now();
  DrinkType selectedDrink = kDrinks[0];
  DrinkType selectedDrinkSize = kGlassSize[0];

  Drink({this.time, this.selectedDrink, this.selectedDrinkSize});
}

class UserData extends ChangeNotifier {
  double _weight = 75;
  double _height = 180;
  gender _gender = gender.male;

  List<Drink> _drinks = [];

  gender get getGender => _gender;
  double get getWeight => _weight;
  double get getHeight => _height;
  List<Drink> get getDrinks => _drinks;
  int get getDrinksCount => _drinks.length;

  UserData() {
    addDrinks();
  }

  void updateDrinksTime(int index, TimeOfDay time) {
    _drinks[index].time = time;
    notifyListeners();
  }

  void addDrinks() {
    _drinks.add(Drink(time: TimeOfDay.now(), selectedDrink: kDrinks[0], selectedDrinkSize: kGlassSize[0]));
    notifyListeners();
  }

  void resetDrinks() {
    _drinks.clear();
    addDrinks();
    notifyListeners();
  }

  void setSelectedDrink(int index, DrinkType value) {
    _drinks[index].selectedDrink = value;
    notifyListeners();
  }

  void setSelectedDrinkSize(int index, DrinkType value) {
    _drinks[index].selectedDrinkSize = value;
    notifyListeners();
  }

  DrinkType getSelectedDrinkSize(int index) {
    return _drinks[index].selectedDrinkSize;
  }

  DrinkType getSelectedDrink(int index) {
    return _drinks[index].selectedDrink;
  }

  void removeDrinks(int index) {
    _drinks.removeAt(index);
    notifyListeners();
  }


  void setGender(gender value) {
    _gender = value;
    notifyListeners();
  }

  void setWeight(double value) {
    _weight = value;
    notifyListeners();
  }

  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  double getAlcohol() {
    TimeOfDay ct = TimeOfDay.now();
    double totalAlcohol = 0;
    for (Drink drink in _drinks) {
      var coeff = 0.0;
      var loseCoeff = 0.0;
      var t = drink.selectedDrink.data;
      var V = drink.selectedDrinkSize.data * 10;
      var time = drink.time;
      int minute = 0;

      if (time.hour <= ct.hour) {
        if (!(time.minute >= ct.minute)) {
          minute = (ct.hour - time.hour) * 60;
          minute += (ct.minute - time.minute);
        }
      }

      if (_gender == gender.male) {
        coeff = 0.7;
        loseCoeff = 0.125;
      } else {
        coeff = 0.6;
        loseCoeff = 0.0925;
      }
      var alcohol = (V * (t / 100) * 0.8) / (coeff * _weight);
      print("minutes d'elimination: " + minute.toString());
      var elimination = minute * loseCoeff / 60;
      print("elimintation " + elimination.toString());
      alcohol -= elimination;
      totalAlcohol += alcohol;
    }
    if (totalAlcohol < 0)
      return (0);
    return (totalAlcohol);
  }

  double getTimeWhenUserIsSober(double currentAlcohol, gender g) {
    double minute;
    if (g == gender.male) {
      minute = (currentAlcohol * 60 / 0.125);
    } else {
      minute = (currentAlcohol * 60 / 0.0925);
    }
    return (minute);
  }
}