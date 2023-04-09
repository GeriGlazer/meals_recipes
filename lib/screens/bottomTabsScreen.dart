import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
bool isIOS = Platform.isIOS;

  List<BottomNavigationBarItem> tabItems(){
    Icon categories = isIOS? Icon(CupertinoIcons.circle_grid_3x3_fill) : Icon(Icons.category);
    Icon favorites = isIOS? Icon(CupertinoIcons.star_circle) : Icon(Icons.star);
    return [
      BottomNavigationBarItem(icon: categories, label: 'Categories'),
      BottomNavigationBarItem(icon: favorites, label: 'Favorites'),
    ];
  }
   final List<Map<String, Object>> _pages = [
     {'page' : CategoriesScreen(), 'title' : 'Meals'},
     {'page' : FavoritesScreen(), 'title': 'Your Favorites'},
   ];
  int _selectedPageIndex=0;

  void _bottomNavigationOnTap(int index){
    setState((){
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isIOS?
    CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabItems(),
        onTap: _bottomNavigationOnTap,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueGrey,
        currentIndex: _selectedPageIndex,
      ),
      tabBuilder: (BuildContext context, int index){
        return CupertinoTabView(
          builder: (BuildContext ctx){
            return _pages[_selectedPageIndex]['page'];
          },
        );
      },
    )
        : Scaffold(
      appBar: (AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      )),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: tabItems(),
        onTap: _bottomNavigationOnTap,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedPageIndex,
      ),
    );;
  }
}
