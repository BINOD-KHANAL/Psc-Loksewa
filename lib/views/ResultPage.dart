

import 'package:flutter/material.dart';
import 'package:realtime_quizeapp/models/question.dart';


class Result extends StatelessWidget {
  const Result({required this.question,required this.score,Key? key}) : super(key: key);
 final question;
 final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey,
      centerTitle: true,
      title: Text('Result'),
      elevation: 0,
    ),
      body: Center(

        child: Column(
          children: [
            Text('result',style: TextStyle(fontSize: 20),),
            Center(
              child: Container(
                child: Text('${score}/${question}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
