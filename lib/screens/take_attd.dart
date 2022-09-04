import 'package:flutter/material.dart';
import 'package:attd_management/models/models.dart';
import 'dart:convert';
import 'dart:async';
import '../connections/DbConnection.dart';

class take_attd extends StatefulWidget {
  final String sub_name;
  const take_attd({Key? key,required this.sub_name}) : super(key: key);
  @override
  _take_attdState createState() => _take_attdState();
}

class _take_attdState extends State<take_attd>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: MongoDatabase.getStudentData(),
            builder: (context,AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else{
                if(snapshot.hasData){
                  return Container(
                    padding: const EdgeInsets.only(top: 120),
                    child: ListView.builder(
                        itemCount:snapshot.data.length ,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                teacherModel.fromJson(snapshot.data[index]).name;
                              });
                            },
                            child: dispCard(
                                studentModel.fromJson(snapshot.data[index])
                            ),
                          );
                        }),
                  );
                }
                else{
                  return const Center(
                    child: Text("No Data to Display"),
                  );
                }
              }
            },
          ),
        ) ,
      ),
    );
  }

  Widget dispCard (studentModel data){
    return Card(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text("${data.name}"),
          SizedBox(height: 10,)
        ],
      ),);
  }

}