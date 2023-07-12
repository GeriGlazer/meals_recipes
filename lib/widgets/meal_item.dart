import 'dart:io';

import 'package:flutter/material.dart';
import 'package:enough_platform_widgets/platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/widgets/meal_item_traits.dart';
import '../screens/single_meal_screen.dart';
import '../../models/meal.dart';
import 'adaptive_card.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({
    super.key,
    required this.meal,
  }
      );

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordabilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  PageRoute pageRoute(bool isIOS)  {
    return isIOS ?
    CupertinoPageRoute(
      builder: (_) {
        return SingleMealScreen();
      },
        settings: RouteSettings(
            name: SingleMealScreen.routeName,
            arguments: {'title' : meal.title},
        )
    )
        : MaterialPageRoute(
        builder: (_) {
          return SingleMealScreen();
        },
        settings: RouteSettings(
            name: SingleMealScreen.routeName,
            arguments: {'title' : meal.title},
        )
    );
  }
  void selectMeal(BuildContext ctx){
    bool isIOS = Platform.isIOS;
    Navigator.of(ctx).push(pageRoute(isIOS));
    //Navigator.of(ctx).pushNamed(SingleMealScreen.routeName, arguments: id);
    //this lines is for use when managing several screens in main-> myApp class ->MaterialApp -> routes:
    //Navigator.of(ctx).pushNamed(
    // '/category-meals',
    //arguments: id,
    // );
  }

  @override
  Widget build(BuildContext context) {
    final sameContainerChild =  Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  meal.title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: <Widget>[
                //todo: build an adaptive method for IOS
                //maybe create a widget that returns Icon(bool platform (Icons/CupertinoIcons).switch case based in string as IconData
                MealItemTraits(icon: Icons.access_time, label: '${meal.duration} min'),
                const SizedBox(width: 15,),
                MealItemTraits(icon: Icons.work, label: complexityText),
                const SizedBox(width: 15,),
                MealItemTraits(icon: Icons.attach_money, label: affordabilityText),
              ],),
            ],
          ),
        )
      ],
    );
    return PlatformInkWell(
      onTap: () => selectMeal(context),
      child: AdaptiveCard(containerChild: sameContainerChild,),
    );
  }
}
