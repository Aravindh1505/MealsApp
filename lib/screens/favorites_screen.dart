import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meals_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _deleteMeals(String mealId) {
    setState(() {
      widget.favoriteMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(child: Text('No favorites added yet!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(widget.favoriteMeals[index], _deleteMeals, true);
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
