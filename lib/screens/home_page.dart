import 'package:flutter/material.dart';

import 'package:attd_management/screens/teacher.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum Option { teacher,student }

class _HomePageState extends State<HomePage>{
  Option defaultValue = Option.teacher;
  String option = "null";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: SingleChildScrollView(
                child:  Column(
                  children: [
                    ListTile(
                      title: const Text("Teacher"),
                      leading: Radio(value: Option.teacher, groupValue: defaultValue, onChanged: (value){
                        setState(() {
                          defaultValue=value as Option;
                          option="teacher";
                        });
                      }),
                    ),
                    ListTile(
                      title: const Text("Student"),
                      leading: Radio(value: Option.student, groupValue: defaultValue, onChanged: (value){
                        setState(() {
                          defaultValue=value as Option;
                          option="student";
                        });
                      }),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if(option=="teacher"){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => teacher()));
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              )
          )
      )
    );
  }

}