import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;


  CategoryItem(this.title, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      //color: backgroundColor,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [backgroundColor.withOpacity(0.7), backgroundColor],
       begin: Alignment.topLeft,
       end: Alignment.bottomRight
      ),
      borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
