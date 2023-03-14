import 'package:flutter/material.dart';
import 'package:realtime_quizeapp/main.dart';


class Initialpage extends StatelessWidget {

  const Initialpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text('लोकसेवा',style: TextStyle(fontSize: 20),),
        elevation: 0,

      ),

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(50),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Center(child: Text('सम-सामयिक GK',style: TextStyle(fontSize: 25),))
            ),

          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[200],
            child: Column(
              children: [
                Image.asset('assets/images/bankimg.jpg',height: 50,),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text('Banking Question',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                )
              ],
            )
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[300],
            child: Column(
              children: [
                Image.asset('assets/images/computer.jpg',height:50,width: double.infinity,),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text('Computer Question',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                )
              ],
            )
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: Column(
                children: [
                  Image.asset('assets/images/quz.jpg',height: 50,),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text('Quiz Game',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),

                ],
              ),
            ),
          ),



        ],

      )
    );
  }
}




