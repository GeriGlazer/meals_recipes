import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/adaptive_card.dart';

import '../categories_mock.dart';

class SingleMealScreen extends StatelessWidget {
  //When using a namedRuote use this variable
  static const routeName = '/single-meal';
   //String id;

  SingleMealScreen();

  @override
  Widget build(BuildContext context) {
    //this lines is for passing arguments from an other screen via routing in
    // pushNamed method
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final mealTitle = arguments['title'];
    final selectedMeal = MEALS_MOCK.firstWhere((meal) => meal.title == mealTitle);
    final pageBody = SafeArea(
      minimum: const EdgeInsets.all(10),
      child:  Column(
        children: <Widget>[
          Container(
            //todo: adapt to MediaQuery
            height: 300,
            width: double.infinity,
            child: Image.network(
                selectedMeal.imageUrl,
            fit: BoxFit.cover,
            ),
          ),
          Container(child: Text('Ingredient', style: Theme.of(context).textTheme.titleLarge,),)
        ],),);

    return Platform.isIOS?
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('$mealTitle'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      child: pageBody,
    )
        : Scaffold(
      appBar: AppBar(
        title: Text('$mealTitle'),
      ),
      body: pageBody,
    );;
  }
}
