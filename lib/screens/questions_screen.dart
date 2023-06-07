import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';

import '../components/navigate.dart';
import '../components/questions.dart';
import '../model/question_model.dart';

class Questions extends StatefulWidget {
  final List<QuestionModel> QuestionsList;
   String? levelNumber;

  Questions({
    required this.QuestionsList,
    required this.levelNumber
  });

  @override
  State<Questions> createState() => _QuestionsState();
}
class _QuestionsState extends State<Questions> {
  PageController page=PageController();
  int currentQuestionIndex = 0; // the index of  question
  int? selectedAnswerIndex; // choose the answer
  int count=0; // counter

  void getNextQuestion() {
    setState(() {
       //         4            /     7 =  5
      if (currentQuestionIndex < questionsList3.length -1 )
      {
        currentQuestionIndex++;
      }
     else
      {
        navigateTo(context,ResultScreen(count: count));

      }
    });

  }
  void selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    var currentQuestion = widget.QuestionsList[currentQuestionIndex];
    return Scaffold(

      backgroundColor: Color(0xff1f1147),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1f1147),
        title:Text('${widget.levelNumber}',
          style: const TextStyle(color: Colors.greenAccent),) ,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){},
              icon:const Icon(Icons.filter_alt)
           )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          physics:const NeverScrollableScrollPhysics(),
          controller: page,
          itemBuilder:(context,index)=> Column(
            children: [
              Text("Question ${currentQuestionIndex + 1}/${questionsList3.length}", // 1 / 10
                style:const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),),

              Text('${currentQuestion.question}',
                style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.normal),
              ),
              ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://img.freepik.com/free-vector/curiosity-brain-concept-illustration_114360-10736.jpg',
                  width: 250,
                ),
              ),
              for (int i = 0; i < currentQuestion.options!.length; i++) // answers
              // 0
              // 1
              // 2
              // 3
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GestureDetector(
                      onTap: () =>
                          selectAnswer(i),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          color: selectedAnswerIndex == i ? Colors.greenAccent : Color(0xff1f1147),),

                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 17,
                              backgroundColor:const Color(0xff8b86f6),
                              child: Text('${i+1}',
                                style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ),
                            Text(' ${currentQuestion.options![i]}',
                              style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),)
                  ),
                ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff6947fe))),
                    onPressed: ()
                    {
                      page.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceIn,
                      );
                      setState(() {
                        currentQuestionIndex--;
                        count --;
                      });
                    } ,
                    child: const Text('Previous Question'),
                  ),
                  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff6947fe))),
                    onPressed: ()
                    {
                      page.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      setState(() {

                        getNextQuestion();

                        if(selectedAnswerIndex == currentQuestion.answer)
                        {
                          setState(() {
                            count++;
                          });
                        }
                      });

                    },
                    child:const Text('Next Question'),
                  ),
                ],
              ),
            ],
          ),
          itemCount: questionsList3.length,

        ),
      ),
    );
  }
}


