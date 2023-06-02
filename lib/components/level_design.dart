import 'package:flutter/material.dart';

import '../model/shape_model.dart';

class LevelDesign extends StatelessWidget {
  Function() ?onTap;
  Color? shapeColor;
  String? levelNumber;
  IconData? icon;


LevelDesign({this.onTap, this.shapeColor, this.levelNumber,this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        child: Stack(
          children: [

            ClipPath(
              clipper: Mycl(),
              child: Container(color: shapeColor,),
            ),
            Center(child: Text('$levelNumber')
            ),
            Center(child: Icon(icon,color: Colors.yellow,)),
          ],
        ),
      ),
    );
  }
}

