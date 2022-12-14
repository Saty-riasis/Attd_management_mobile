import 'package:attd_management/connections/DbConnection.dart';
import 'package:attd_management/models/models.dart';
import 'package:attd_management/screens/home_page.dart';
import 'package:attd_management/screens/take_attd.dart';
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
    String sub_ch ="";
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: MongoDatabase.getSubjectData(),
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
                                sub_ch=teacherModel.fromJson(snapshot.data[index]).name;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => take_attd(sub_name: sub_ch)));
                              });
                            },
                            child: dispCard(
                                teacherModel.fromJson(snapshot.data[index])
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

  Widget dispCard (teacherModel data){
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

