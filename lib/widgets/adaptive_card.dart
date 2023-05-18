import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/meal.dart';

class AdaptiveCard extends StatelessWidget {
  Widget containerChild;

  AdaptiveCard({required this.containerChild});


  @override
  Widget build(BuildContext context) {
    //final isIOS = Platform.isIOS;

    return //isIOS?
    // CupertinoButton(
    //   child: Container(
    //     decoration: BoxDecoration(
    //       boxShadow: <BoxShadow>[BoxShadow(
    //         color: Colors.black45,
    //         blurRadius: 15,
    //         offset: Offset(0, 1),
    //       ),
    //       ],
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: containerChild,
    //   ),) :
    Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: containerChild,
    );
  }
}
