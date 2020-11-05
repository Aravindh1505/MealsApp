import 'package:flutter/material.dart';
import 'package:meals_app/utils/constants.dart';
import 'package:meals_app/widget/meals_item.dart';

import '../models/categories.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMealsList = Constants.DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(categoryMealsList[index]);
        },
        itemCount: categoryMealsList.length,
      ),
    );
  }
}
