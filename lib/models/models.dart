import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

teacherModel teacherModelFromJson(String str) =>
    teacherModel.fromJson(json.decode(str));

studentModel studentModelFromJson(String str) =>
    studentModel.fromJson(json.decode(str));

class teacherModel {
  teacherModel({
    required this.id,
    required this.name
});
  ObjectId id;
  String name;

  factory teacherModel.fromJson(Map<String,dynamic> json) =>teacherModel(
      id: json['_id'],
      name: json['name']
  );

  Map<String,dynamic> toJson() =>{
    "_id":id,
    "name":name
  };
}


class studentModel {
  studentModel({
    required this.id,
    required this.name
  });
  ObjectId id;
  String name;

  factory studentModel.fromJson(Map<String,dynamic> json) =>studentModel(
      id: json['_id'],
      name: json['name']
  );

  Map<String,dynamic> toJson() =>{
    "_id":id,
    "name":name
  };
}