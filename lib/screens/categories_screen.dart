import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: Constants.DUMMY_CATEGORIES.map((categoryItem) => CategoryItem(categoryItem)).toList(),
    );
  }
}
