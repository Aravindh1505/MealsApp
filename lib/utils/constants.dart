import 'package:flutter/material.dart';

import '../models/categories.dart';

class Constants {
  static const APP_NAME = 'Meal App';

  /*ROUTES*/
  static const ROUTE_CATEGORY_MEALS = '/category-meals';

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    accentColor: Colors.amber,
    cursorColor: Colors.amber,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.red),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.black87,
    primaryColor: Colors.black87,
    accentColor: Colors.amber,
    cursorColor: Colors.amber,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.black87,
    fontFamily: 'Raleway',
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.red),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
  );

  static const DUMMY_CATEGORIES = const [
    Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      color: Colors.red,
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
    ),
    Category(
      id: 'c4',
      title: 'German',
      color: Colors.amber,
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      color: Colors.blue,
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
    ),
    Category(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
    ),
    Category(
      id: 'c10',
      title: 'Summer',
      color: Colors.teal,
    ),
  ];
}
