import 'package:attd_management/connections/DbConnection.dart';
import 'package:attd_management/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class teacher extends StatefulWidget {
  const teacher({Key? key}) : super(key: key);

  @override
  _teacherState createState() => _teacherState();
}

class _teacherState extends State<teacher> {
  List sub_ls = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: MongoDatabase.getData(),
            builder: (context,AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else{
                if(snapshot.hasData){
                  return Container(
                    child: ListView.builder(
                        itemCount:snapshot.data.length ,
                        itemBuilder: (context,index){
                          return dispCard(
                            teacherModel.fromJson(snapshot.data[index])
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

  Widget dispCard (teacherModel data){
    return Card(
      child: Column(
      children: [
        Text("${data.name}")
      ],
    ),);
  }
}

