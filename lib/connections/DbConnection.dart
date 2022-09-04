import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import '../constant.dart';

class MongoDatabase {
  static var db,subject_collection,student_collection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    subject_collection = db.collection("subject");
    student_collection = db.collection("student");
  }

  static Future<List<Map<String,dynamic>>> getSubjectData() async {
    final arrData = await subject_collection.find().toList();
    return arrData;
  }

  static Future<List<Map<String,dynamic>>> getStudentData() async {
    final arrData = await student_collection.find().toList();
    return arrData;
  }


}