import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class  AdaptiveDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String text, IconData icon, Function tapHandler){
      return ListTile(
        leading: Icon(
          icon, size: 26,),
        title: Text(text, style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        onTap: () => tapHandler(),
      );
    }
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorLight,
            child: Text('Menu', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColorDark,
            ),),
          ),
          SizedBox(height: 20,),
          buildListTile(
              'All recipes',
              Icons.restaurant,
              (){
               Navigator.of(context).pushReplacementNamed('/');
              },
          ),
          buildListTile(
              'Filters',
              Icons.settings,
              (){
                //Instead of using pusheNamed and adding an other screen in the stack every time the drawer is used
                //(because there is no back arrow that cleans the previous screen)
                //the Replacement takes the current screen as the only screen in the stack and erases the previous ones
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              },
          ),
        ],
      ),
    );
  }
}
