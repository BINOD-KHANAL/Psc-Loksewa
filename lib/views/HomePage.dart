
import 'package:flutter/material.dart';
import 'package:realtime_quizeapp/views/ResultPage.dart';

import '../models/question.dart';



class QuestionPage extends StatefulWidget {
   QuestionPage({Key? key, required this.questions}) : super(key: key);

   List<Question> questions;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  int currentindex=0;
  String selectedAnswer = '';
 // late bool isSelected;
  int score=0;




  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentindex];
    return  Scaffold(
      body: Column(
        children: [
          Text('${score}'),
          Padding(
            padding: const EdgeInsets.only(top: 45,left: 5),
            child: Container(
              height: 70,
         child: Text(question.question,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers.length,
                itemBuilder: (context,index){
               final answer = question.answers[index];
                  return AnswerOptions(
                isSelected: answer == selectedAnswer,
                    answer: answer,
                    correctAnswer: question.correctAnswer,
                    onTap: (){

             setState(() {
               selectedAnswer= answer;
             });

             if (answer==question.correctAnswer){
               score++;
             }
 Future.delayed(Duration(microseconds: 201),(){
   if(currentindex == widget.questions.length-1){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(score: score, question: widget.questions.length,)));
      return;



   }
   setState(() {
     currentindex++;
     selectedAnswer='';
   });

 });


                    },
                  );




            }),
          )
        ],

      )
    );

  }

}

class AnswerOptions extends StatelessWidget {
  const AnswerOptions({
    required this.answer,required this.onTap, required this.correctAnswer,required this.isSelected
    ,Key? key,
  }) : super(key: key);


  final String answer;
  final String correctAnswer;
  final Function onTap;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        onTap: ()=>onTap(),
title: Text(answer),
      ),
    );
  }
   Color get cardColor{
    if(!isSelected)
      return Colors.white;

    if( answer == correctAnswer){
      return Colors.green;

    }
    return Colors.red;


  }


}






