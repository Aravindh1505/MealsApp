import 'package:flutter/material.dart';

import '../models/filters.dart';
import '../widget/custom_widgets.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function _setFilters;
  final Filters _filters;

  FilterScreen(this._setFilters, this._filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Widget _buildSwitchListTitle(String title, String subTitle, bool filterValue, Function onChangedHandler) {
    return SwitchListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyText2),
      value: filterValue,
      onChanged: onChangedHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: CustomWidgets.getAppBar(context, 'Filter'),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTitle('Gluten-Free', 'Only include Gluten-Free meals', widget._filters.isGlutenFree, (newValue) {
                setState(() {
                  widget._filters.isGlutenFree = newValue;
                });
              }),
              _buildSwitchListTitle('Vegan', 'Only include Vegan meals', widget._filters.isVegan, (newValue) {
                setState(() {
                  widget._filters.isVegan = newValue;
                });
              }),
              _buildSwitchListTitle('Vegetarian', 'Only include Vegetarian meals', widget._filters.isVegetarian, (newValue) {
                setState(() {
                  widget._filters.isVegetarian = newValue;
                });
              }),
              _buildSwitchListTitle('Lactose-Free', 'Only include Lactose-Free meals', widget._filters.isLactoseFree, (newValue) {
                setState(() {
                  widget._filters.isLactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          widget._setFilters(widget._filters);
        },
      ),
    );
  }
}
