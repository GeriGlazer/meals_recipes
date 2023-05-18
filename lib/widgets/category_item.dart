import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/category.dart';
import 'package:enough_platform_widgets/platform.dart';
import '../screens/meals_screen_by_category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;
  CategoryItem(
      {super.key,
        required this.category,
       }
      );

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
       arguments: {'id': category.id, 'title': category.title},
     )
   )
       : MaterialPageRoute(
       builder: (_) {
         return MealsScreenByCategory();
       },
       settings: RouteSettings(
           name: MealsScreenByCategory.routeName,
           arguments: {'id': category.id, 'title': category.title}
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
              category.title,
            overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,),
        ),
        //color: backgroundColor,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9)
              ],
         begin: Alignment.topLeft,
         end: Alignment.bottomRight
        ),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
