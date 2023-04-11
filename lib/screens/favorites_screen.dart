import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
   List<Meal> _favoriteMeals;

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
            title: _favoriteMeals[index].title,
            imageURL: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            affordability: _favoriteMeals[index].affordability,
            complexity: _favoriteMeals[index].complexity,);
        },
        itemCount: _favoriteMeals.length,
      );

    };
  }
}
