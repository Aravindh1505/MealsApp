import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: Constants.lightTheme,
      routes: {
        Constants.ROUTE_HOME: (ctx) => TabsScreen(),
        Constants.ROUTE_CATEGORY_MEALS: (ctx) => CategoryMealsScreen(),
        Constants.ROUTE_MEALS_DETAILS: (ctx) => MealDetailsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
