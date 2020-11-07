import 'package:flutter/material.dart';

import './models/filters.dart';
import './models/meal.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/favorites_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters.name(isGlutenFree: false, isVegan: false, isVegetarian: false, isLactoseFree: false);

  List<Meal> _availableMeals = Constants().dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Filters filters) {
    setState(() {
      _filters = filters;

      _availableMeals = Constants().dummyMeals.where((meal) {
        if (_filters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filters.isVegan && !meal.isVegan) {
          return false;
        }
        if (_filters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        if (_filters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();

      print('_availableMeals ${_availableMeals.length}');
    });
  }

  void _setFavorites(String mealId) {
    int existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    print('existingIndex : $existingIndex');

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(Constants().dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }

    print(_favoriteMeals.length);
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: Constants.lightTheme,
      routes: {
        Constants.ROUTE_HOME: (ctx) => TabsScreen(_favoriteMeals),
        Constants.ROUTE_CATEGORY_MEALS: (ctx) => CategoryMealsScreen(_availableMeals),
        Constants.ROUTE_MEALS_DETAILS: (ctx) => MealDetailsScreen(_setFavorites, _isFavorite),
        Constants.ROUTE_FAVORITES: (ctx) => FavoritesScreen(_favoriteMeals),
        Constants.ROUTE_FILTERS: (ctx) => FilterScreen(_setFilters, _filters),
        Constants.ROUTE_SETTINGS: (ctx) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
