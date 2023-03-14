import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_quizeapp/views/HomePage.dart';
import 'package:realtime_quizeapp/views/initialPage.dart';

import 'models/question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: Colors.cyan),
        home:Initialpage());
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){

            return Center(
                child:  CircularProgressIndicator());

          }
          final questionsDocs =snapshot.data!.docs;
            final questions = questionsDocs.map((e) => Question.fromQueryDocumentSnapshot(e)).toList();
            //print(questions);
          return TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionPage(questions: questions)));

          }, child:Text('lets play Quiz Game',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));



        }

    );


  }
}

// StreamBuilder<QuerySnapshot>(
// stream: FirebaseFirestore.instance.collection('questions').snapshots(),
// builder: (context,snapshot){
//
// if(!snapshot.hasData ){
// return Center(child: CircularProgressIndicator());
// }
//
