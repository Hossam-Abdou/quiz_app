import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';

import '../components/level_design.dart';
import '../components/navigate.dart';
import '../components/questions.dart';

class Levels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff1f1147),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Color(0xff1f1147),
        title:Text('Levels',style: TextStyle(color: Colors.greenAccent),) ,
        centerTitle: true,
      ),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: [
          LevelDesign(
          onTap:(){
            navigateTo(context,Questions(QuestionsList: questionsList,levelNumber: 'level \n  01',));
            },
            levelNumber: 'level \n  01',shapeColor: Colors.blueGrey, ),

          LevelDesign(onTap:()
          {
            navigateTo(context,Questions(QuestionsList: questionsList1,levelNumber: 'level \n  02',));
          } ,levelNumber: 'level \n  02',shapeColor: Colors.lightBlue, ),

          LevelDesign(onTap:()
          {
            navigateTo(context,Questions(QuestionsList: questionsList2,levelNumber: 'level \n  03',));
          },levelNumber: 'level \n  03', shapeColor: Colors.deepOrange, ),

          LevelDesign(onTap:()
          {
            navigateTo(context,Questions(QuestionsList: questionsList3,levelNumber: 'level \n  04',));
          }, shapeColor: Colors.purpleAccent,levelNumber: 'level \n  04' ),

          LevelDesign(icon: Icons.lock,
            levelNumber: 'level \n  05', shapeColor: Colors.greenAccent, ),

        ],
      ),
    );
  }
}


