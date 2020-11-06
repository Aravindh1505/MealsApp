import 'package:flutter/material.dart';
import 'package:meals_app/utils/constants.dart';

import '../models/meal.dart';
import '../widget/error_screen.dart';

class MealDetailsScreen extends StatelessWidget {
  Widget buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildListView(BuildContext context, List<String> list) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '* ${list[index]}',
          ),
        ),
        itemCount: list.length,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
    );
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
    final selectedMeal = ModalRoute.of(context).settings.arguments as Meal;

    return selectedMeal != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(selectedMeal.title),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRowIcons('${selectedMeal.duration} min', Icons.schedule),
                          buildRowIcons(Constants.getEnumString(selectedMeal.complexity.toString()), Icons.work),
                          buildRowIcons(Constants.getEnumString(selectedMeal.affordability.toString()), Icons.monetization_on),
                        ],
                      ),
                    ),
                    const Divider(thickness: 2),
                    buildTitle(context, 'Ingredients'),
                    buildListView(context, selectedMeal.ingredients),
                    buildTitle(context, 'Steps'),
                    buildListView(context, selectedMeal.steps),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.delete),
              onPressed: () {
                Navigator.of(context).pop(selectedMeal.id);
              },
            ),
          )
        : ErrorScreen();
  }
}
