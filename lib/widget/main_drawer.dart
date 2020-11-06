import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function selectedMenu) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: selectedMenu,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Image.asset(
              Constants.ASSET_COOKING,
              width: 50,
              height: 50,
              alignment: Alignment.center,
            ),
          ),
          buildListTitle('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(Constants.ROUTE_HOME);
          }),
          buildListTitle('Filter', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(Constants.ROUTE_FILTERS);
          }),
          buildListTitle('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Constants.ROUTE_SETTINGS);
          }),
        ],
      ),
    );
  }
}
