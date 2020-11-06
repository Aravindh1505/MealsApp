import 'package:flutter/material.dart';

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
                          Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(width: 5),
                              Text('${selectedMeal.duration} min'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.work),
                              SizedBox(width: 5),
                              Text('${selectedMeal.complexity.toString().split('.').last}'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.monetization_on),
                              SizedBox(width: 5),
                              Text('${selectedMeal.affordability.toString().split('.').last}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    buildTitle(context, 'Ingredients'),
                    buildListView(context, selectedMeal.ingredients),
                    buildTitle(context, 'Steps'),
                    buildListView(context, selectedMeal.steps),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.delete),
              onPressed: () {
                Navigator.of(context).pop(selectedMeal.id);
              },
            ),
          )
        : ErrorScreen();
  }
}
