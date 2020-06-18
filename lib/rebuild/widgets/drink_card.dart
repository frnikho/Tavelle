import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/utils/colors.dart';

class DrinkCard extends StatelessWidget {

  final Drink drinks;
  final int index;

  DrinkCard({this.drinks, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Consumer<UserData>(
        builder: (context, data, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () async{
                    TimeOfDay _time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                    if (_time != null)
                      data.updateDrinksTime(index, _time);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(drinks.time.format(context), style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500)),
                      FaIcon(FontAwesomeIcons.clock, color: primaryColor),
                    ],
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<DrinkType>(
                    iconSize: 0,
                    elevation: 5,
                    value: data.getSelectedDrink(index),
                    items: kDrinks.map<DropdownMenuItem<DrinkType>>((DrinkType value) {
                      return DropdownMenuItem<DrinkType>(
                        value: value,
                        child: value,
                      );
                    }).toList(),
                    onChanged: (selected) {
                      data.setSelectedDrink(index, selected);
                    }
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<DrinkType>(
                    iconSize: 0,
                    elevation: 5,
                    value: data.getSelectedDrinkSize(index),
                    items: kGlassSize.map<DropdownMenuItem<DrinkType>>((DrinkType value) {
                      return DropdownMenuItem<DrinkType>(
                        value: value,
                        child: value,
                      );
                    }).toList(),
                    onChanged: (selected) {
                      data.setSelectedDrinkSize(index, selected);
                    }
                ),
              ),
              GestureDetector(
                child: FaIcon(Icons.remove, color: Colors.redAccent, size: 28),
                onTap: () {
                  data.removeDrinks(index);
                },
              )
            ],
          );
        },
      ),
    );
  }
}