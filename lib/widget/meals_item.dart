import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsItem extends StatelessWidget {
  final Meal meal;

  MealsItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
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
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 5),
                        Text('${meal.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 5),
                        Text('${meal.complexity.toString().split('.').last}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(width: 5),
                        Text('${meal.affordability.toString().split('.').last}'),
                      ],
                    ),
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
