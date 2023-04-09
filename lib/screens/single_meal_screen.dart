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

  Widget buildSectionTitle(BuildContext ctx, String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
          text,
          style: Theme.of(ctx).textTheme.titleLarge
      ),
    );
  }

  Widget buildListViewContainer(BuildContext ctx ,Widget child){
    return Container(
        //todo: mediaQuery
        height: 150,
        width: 300,
        decoration: BoxDecoration(
        color: Color.fromRGBO(255, 254, 229, 1),
    border: Border.all(color: Theme.of(ctx).primaryColorDark),
    borderRadius: BorderRadius.circular(10)
    ),
    padding: EdgeInsets.all(5),
    child: child,
    );
  }
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
      child:  SingleChildScrollView(
        child: Column(
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
            buildSectionTitle(context, 'Ingredients'),
            buildListViewContainer(
              context,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).primaryColorLight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          selectedMeal.ingredients[index],
                        ),
                      )
                  )
              )
            ),
            buildSectionTitle(context, 'Steps'),
            buildListViewContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index+1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  itemCount: selectedMeal.steps.length,))
          ],),
      ),);

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
