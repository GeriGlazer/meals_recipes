import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:enough_platform_widgets/platform.dart';
import '../screens/meals_screen_by_category.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color backgroundColor;


  CategoryItem(this.title, this.backgroundColor, this.id);

  PageRoute pageRoute(bool isIOS)  {
   return isIOS != null?
       // CupertinoPageRoute(
       //    settings: RouteSettings(
       //      name: MealsScreenByCategory.routeName,
       //      arguments: {'id': id, 'title': title},
       //    ),
       // )
   CupertinoPageRoute(
     builder: (_) {
       return MealsScreenByCategory();
     },
     settings: RouteSettings(
       name: MealsScreenByCategory.routeName,
       arguments: {'id': id, 'title': title},
     )
   )
       : MaterialPageRoute(
       builder: (_) {
         return MealsScreenByCategory();
       },
       settings: RouteSettings(
           name: MealsScreenByCategory.routeName,
           arguments: {'id': id, 'title': title}
       )
   );
  }

  void selectCategory (BuildContext ctx){
    bool isIOS = Platform.isIOS;
    Navigator.of(ctx).push(pageRoute(isIOS));
    //this lines is for use when managing several screens in main-> myApp class ->MaterialApp -> routes:
    //Navigator.of(ctx).pushNamed(
    // '/category-meals',
    // arguments: {'id': id, 'title': title} );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformInkWell(
      onTap: () => selectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          alignment: Alignment.center,
          child: Text(
              title,
            overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,),
        ),
        //color: backgroundColor,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [backgroundColor.withOpacity(0.7), backgroundColor],
         begin: Alignment.topLeft,
         end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
