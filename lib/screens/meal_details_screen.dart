import 'package:flutter/material.dart';
import 'package:meals_app/utils/constants.dart';
import 'package:meals_app/widget/custom_widgets.dart';

import '../models/meal.dart';
import '../widget/error_screen.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function setFavorites;
  final Function isFavorite;

  MealDetailsScreen(this.setFavorites, this.isFavorite);

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
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMeal = routeArgs['meal'] as Meal;
    final isFromFavorites = routeArgs['isFromFavorites'] as bool;

    return selectedMeal != null
        ? Scaffold(
            appBar: CustomWidgets.getAppBar(context, selectedMeal.title),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          selectedMeal.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0.1,
                          top: 0.1,
                          child: Container(
                            color: Colors.black87,
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                setFavorites(selectedMeal.id);
                                if (isFromFavorites) {
                                  Navigator.of(context).pop(selectedMeal.id);
                                }
                              },
                              child: Icon(
                                isFavorite(selectedMeal.id) ? Icons.favorite : Icons.favorite_border,
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
