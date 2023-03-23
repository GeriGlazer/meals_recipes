import 'dart:io';

import 'package:flutter/material.dart';
import 'package:enough_platform_widgets/platform.dart';
import 'package:flutter/cupertino.dart';
import '../../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.imageURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordability}
      );

  void selectMeal(){}

  Widget adaptiveCard (BuildContext ctx){
    final isIOS = Platform.isIOS;
    final sameContainerChild =  Column(
      children: <Widget>[
        Stack(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("assets/mindful.jpg"),
          //       fit: BoxFit.cover,
          //     )
          // ),
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageURL,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
          
        ),
      ],
    );
    return isIOS?
    CupertinoButton(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(
              color: Colors.black45,
              blurRadius: 15,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: sameContainerChild;
      onPressed: ()  {},
    ) : Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: sameContainerChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformInkWell(
      onTap: selectMeal,
      child: adaptiveCard(context),
    );
  }
}
