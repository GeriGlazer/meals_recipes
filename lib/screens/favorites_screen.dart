import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
   final List<Meal> _favoriteMeals;
   FavoritesScreen(this._favoriteMeals);
   /*void _toggleFavorites(String mealId){
     final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
     if(existingIndex >=0){
       setState(() {
         favoriteMeals.removeAt(existingIndex);
       });
     } else {
       setState(() {
         favoriteMeals.add(
           MEALS_MOCK.firstWhere((meal) => meal.id == mealId),
         );
       });
     }
   }*/

  @override
  Widget build(BuildContext context) {
     if (_favoriteMeals.isEmpty){
      return Center(
        child: Text('My Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            meal: _favoriteMeals[index],
           );
        },
        itemCount: _favoriteMeals.length,
      );

    };
  }
}
