import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/constants.dart';

class MealsItem extends StatelessWidget {
  final Meal meal;
  final deleteMeal;

  MealsItem(this.meal, this.deleteMeal);

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(Constants.ROUTE_MEALS_DETAILS, arguments: meal).then((value) {
      print('value : $value');
      if (value != null) {
        deleteMeal(value);
      }
    });
  }

  Widget buildRowIcons(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Container(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 20,
                    child: Container(
                      color: Colors.black54,
                      width: 300,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        meal.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildRowIcons('${meal.duration} min', Icons.schedule),
                    buildRowIcons(Constants.getEnumString(meal.complexity.toString()), Icons.work),
                    buildRowIcons(Constants.getEnumString(meal.affordability.toString()), Icons.monetization_on),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
