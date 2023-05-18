import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/models/category.dart';

import '../widgets/category_item.dart';
import '../data/categories_mock.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen ({super.key});

  List<Widget> gridViewChildren(){
    return CATEGORIES_MOCK.map((catData) => CategoryItem(
        category: catData),
    ).toList();
  }


  @override
  Widget build(BuildContext context) {
    final pageBody = SafeArea(
      minimum: const EdgeInsets.all(10),
        child: GridView(
          children: gridViewChildren(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:  3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
    return Platform.isIOS?
    CupertinoPageScaffold(
      child: pageBody,
    )
    : Scaffold(
      body: pageBody,
    );
  }
}
