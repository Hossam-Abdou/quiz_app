import 'package:flutter/material.dart';
import '../components/navigate.dart';
import '../components/questions.dart';
import 'levels_screen.dart';
class ResultScreen extends StatelessWidget {

     int count;
   ResultScreen({required this.count});

  @override
  Widget build(BuildContext context) {
    double score= (count / questionsList3.length) * 100;

     getStarRating() {
       if (score < 50) {
         return const Column(
           children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Icon(Icons.star_border,color: Colors.yellowAccent,),
               Icon(Icons.star_border,color: Colors.yellowAccent,),
               Icon(Icons.star_border,color: Colors.yellowAccent,),
             ],),
             Text('Failed')
           ],
         );
       }
       else if (score < 60) {
         return const Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.star,color: Colors.yellowAccent,),
             Icon(Icons.star_border,color: Colors.yellowAccent,),
             Icon(Icons.star_border,color: Colors.yellowAccent,),
           ],
         );
       }
       else if (score < 80) {
         return const Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.star,color: Colors.yellowAccent,),
             Icon(Icons.star,color: Colors.yellowAccent,),
             Icon(Icons.star_border,color: Colors.yellowAccent,),

           ],
         );
       }  else {
         return const Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.star,color: Colors.yellowAccent,),
             Icon(Icons.star,color: Colors.yellowAccent,),
             Icon(Icons.star,color: Colors.yellowAccent,),
           ],
         );
       }

    }

    return Scaffold(
      backgroundColor: Color(0xff1f1147),
      appBar: AppBar(
        backgroundColor:  Color(0xff1f1147),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title:const Text('Results',style: TextStyle(color: Colors.greenAccent),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const  Text('Total correct answers ',style: TextStyle(color: Colors.white,fontSize: 17),),

          Text('$count out of ${questionsList3.length}',
            style:const TextStyle(color: Colors.greenAccent,fontSize: 17),),
          Center(
            child: Container(width: 300,height: 350,
              decoration: BoxDecoration(
                color: Color(0xff765bf4),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Your final Score is',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.amber,
                    child: Text('${score.toInt()}',
                      style: const TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),),),
                   const SizedBox(height: 15,),
                    getStarRating(),
                ],),
            ),
          ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ElevatedButton(
                          style:ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 70,),
                              backgroundColor: Color(0xff6744fe),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17) )
                          ),
                          onPressed: () {
                            navigateTo(context,Levels());
                          },
                          child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.repeat,color: Colors.white,),
                            Text(' Try Again',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          ]),)
                        ),
              ),),

        ],),
      ),
    );
  }
}

