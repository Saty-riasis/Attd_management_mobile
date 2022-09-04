import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import '../constant.dart';

class MongoDatabase {
  static var db,collection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    collection = db.collection("subject");
    //print(await collection.find().toList());
  }

  static Future<List<Map<String,dynamic>>> getData() async {
    final arrData = await collection.find().toList();
    return arrData;
  }


}