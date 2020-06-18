import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tavelle/rebuild/models/user_data.dart';
import 'package:tavelle/rebuild/screens/drinks.dart';

import 'drink_card.dart';

class DrinkListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
        builder: (context, data, child) {
          return Flexible(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: ListView.builder(itemCount: data.getDrinksCount, itemBuilder: (context, index) => DrinkCard(drinks: data.getDrinks[index], index: index),
              ),
            ),
          );
        }
    );
  }
}
