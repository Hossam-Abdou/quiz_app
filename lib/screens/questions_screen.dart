import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';

import '../components/questions.dart';
import '../model/question_model.dart';

class Questions extends StatefulWidget {
  final List<QuestionModel> QuestionsList;
   String? levelNumber;

  Questions({required this.QuestionsList,required this.levelNumber});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int count=0;



void selectAnswer(int index) {
  setState(() {
    selectedAnswerIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {

    QuestionModel currentQuestion = widget.QuestionsList[currentQuestionIndex];

    void getResult() {
      if(selectedAnswerIndex==currentQuestion.answer)
      {
        setState(() {
          count++;
        });

      }
    }
   int index=0;
    void getNextQuestion() {
      setState(() {
        if (currentQuestionIndex < questionsList.length - 1)
        {
          currentQuestionIndex++;
        }
        else if(currentQuestionIndex == 0)
        {

        }else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return ResultScreen(count);
          }
          ));
        }

      });

    }

    return Scaffold(

      backgroundColor: Color(0xff1f1147),
      appBar: AppBar(
        title:Text('${widget.levelNumber}',style: TextStyle(color: Colors.greenAccent),) ,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Text("Question ${currentQuestionIndex + 1}/${questionsList3.length}",
                style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),),

          Text('${currentQuestion.question}',
            style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),
          ),
          ClipRRect(borderRadius: BorderRadius.circular(10),
            child: Image.network(
                'https://img.freepik.com/free-vector/curiosity-brain-concept-illustration_114360-10736.jpg',
              width: 250,
            ),
          ),


              for (int i = 0; i < currentQuestion.options!.length; i++)
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GestureDetector(
                      onTap: () => selectAnswer(i),
                      child: Container(width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedAnswerIndex == i ? Colors.greenAccent : Color(0xff1f1147),),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 17,
                              backgroundColor: Color(0xff8b86f6),
                              child: Text('${i+1}',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                            Text(' ${currentQuestion.options![i]}',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

                          ],
                        ),)
                  ),
                ),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff6947fe))),
                onPressed: ()
                {
                  setState(() {
                    currentQuestionIndex--;

                  });
                } ,
                child: Text('Back Question'),
              ),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff6947fe))),
                onPressed: ()
                  {
                    setState(() {
                    getNextQuestion();
                    getResult();
                  });

                  },
                child: Text('Next Question'),
              ),



            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}


