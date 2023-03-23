import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/models/category.dart';

import '../widgets/category_item.dart';
import '../categories_mock.dart';

class CategoriesScreen extends StatelessWidget {

  List<Widget> gridViewChildren(){
    return CATEGORIES_MOCK.map((catData) => CategoryItem(
        catData.title,
        catData.color,
        catData.id),
    ).toList();
  }


  @override
  Widget build(BuildContext context) {
    final pageBody = SafeArea(
      minimum: const EdgeInsets.all(10),
        child: GridView(
          children: gridViewChildren(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:  3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
    return Platform.isIOS?
    CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: const Text("Meals!!"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        ),
      ),
      child: pageBody,
    )
    : Scaffold(
      appBar: AppBar(
        title: const Text('Meals!!'),
      ),
      body: pageBody,
    );
  }
}
