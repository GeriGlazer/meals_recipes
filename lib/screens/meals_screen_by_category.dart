import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../categories_mock.dart';

class MealsScreenByCategory extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;


  const MealsScreenByCategory(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //this lines is for passing arguments from an other screen via routing in
    // pushNamed method instead of gridViewChildren() method
    // final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    //final categoryId = routeArgs['id'];
    final categoryMeals = MEALS_MOCK.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Platform.isIOS?
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(categoryTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      //todo: not working
      child: CupertinoFormSection.insetGrouped(
        children: [
          ...List.generate(categoryMeals.length, (index) => MealItem(
              title: categoryMeals[index].title,
              imageURL: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity))
        ]
      ),
    )
        : Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(
          title: categoryMeals[index].title,
          imageURL: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,);
      }, itemCount: categoryMeals.length,),
    );
  }
}
