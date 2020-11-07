import 'package:flutter/material.dart';

import '../widget/custom_widgets.dart';
import '../widget/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: CustomWidgets.getAppBar(context, 'Settings'),
    );
  }
}
