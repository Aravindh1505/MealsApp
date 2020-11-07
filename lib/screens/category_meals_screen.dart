import 'package:flutter/material.dart';
import 'package:meals_app/utils/constants.dart';

import '../models/categories.dart';
import '../models/meal.dart';
import '../widget/custom_widgets.dart';
import '../widget/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> _categoryMealsList;

  CategoryMealsScreen(this._categoryMealsList);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _displayMeals;
  String categoryTitle;
  var _loadedInitData = false;

  void _deleteMeals(String mealId) {
    setState(() {
      _displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final category = ModalRoute.of(context).settings.arguments as Category;
      categoryTitle = category.title;

      _displayMeals = widget._categoryMealsList.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.getAppBar(context, categoryTitle),
      body: _displayMeals.length == 0
          ? Center(
              child: Text(
                Constants.NO_MEALS_FOUND,
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealsItem(_displayMeals[index], _deleteMeals, false);
              },
              itemCount: _displayMeals.length,
            ),
    );
  }
}
