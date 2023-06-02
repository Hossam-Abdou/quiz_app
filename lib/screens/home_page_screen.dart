import 'package:flutter/material.dart';
import 'package:quiz_app/screens/levels_screen.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1147),

      body: Container(width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back4.jpeg')
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16),
          child: Column(
            children: [
              Image.asset('assets/images/lamp.png',width: 220,),
              Text('Quizless',style: TextStyle(color: Color(0xff36edbd) ,fontWeight: FontWeight.bold,fontSize: 28),),
              SizedBox(height: 15,),
              Text('Let\'s play!',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),
              SizedBox(height: 7,),
              Text('Play now and level up',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),),

              Spacer(),
              InkWell(onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)
              {
                return Levels();
              }
              ));},
                child: Container(width: 200,height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff6a49fe)
                  ),
                  child: Center(child: Text('Play Now',style: TextStyle(color: Colors.white,fontSize: 20),)),),
              ),
              SizedBox(height: 15,),
              InkWell(
                child: Container(width: 180,height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff39287f),

                    ),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff1f1147)
                  ),
                  child: Center(child: Text('About',style: TextStyle(color: Color(0xff5539ca),fontSize: 20),)),),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
