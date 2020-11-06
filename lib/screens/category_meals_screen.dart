import 'package:flutter/material.dart';

import '../models/categories.dart';
import '../models/meal.dart';
import '../utils/constants.dart';
import '../widget/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> categoryMealsList;
  String categoryTitle;
  var _loadedInitData = false;

  void _deleteMeals(String mealId) {
    setState(() {
      categoryMealsList.removeWhere((meal) => meal.id == mealId);
      print(categoryMealsList.length);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final category = ModalRoute.of(context).settings.arguments as Category;
      categoryTitle = category.title;

      categoryMealsList = Constants.DUMMY_MEALS.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(categoryMealsList[index], _deleteMeals);
        },
        itemCount: categoryMealsList.length,
      ),
    );
  }
}
