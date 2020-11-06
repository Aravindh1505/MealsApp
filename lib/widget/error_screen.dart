import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Constants.ERROR_EMPTY_DATA,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
