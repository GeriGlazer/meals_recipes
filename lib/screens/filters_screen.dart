import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/adaptive_drawer.dart';
import '../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  Widget _buildSwitchListTile(String text, bool currentValue, Function updateValue){
    return SwitchListTile(
        title: Text(text, style: Theme.of(context).textTheme.titleMedium,),
        value: currentValue,
        onChanged: updateValue
        );
  }

  @override
  Widget build(BuildContext context) {
     final pageBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals selection',
              style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile('Gluten Free', Filters.gluten, (newValue){
                    setState(() {
                    Filters.gluten = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian', Filters.vegetarian, (newValue){
                    setState(() {
                      Filters.vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegan', Filters.vegan, (newValue){
                    setState(() {
                      Filters.vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose Free', Filters.lactose, (newValue){
                    setState(() {
                      Filters.lactose = newValue;
                    });
                  }),
                ],
              ))
        ],
      );

      return Platform.isIOS?
      CupertinoPageScaffold(
        child: pageBody,
      )
          : Scaffold(
        appBar: AppBar(
          title: Text('Filters'),),
        drawer: AdaptiveDrawer(),
        body: pageBody,

      );
  }
}
