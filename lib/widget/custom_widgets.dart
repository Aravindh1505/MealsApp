import 'package:flutter/material.dart';

class CustomWidgets {
  static AppBar getAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
