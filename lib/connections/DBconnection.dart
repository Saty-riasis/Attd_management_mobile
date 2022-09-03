import 'package:mongo_dart/mongo_dart.dart' ;

class MongoDatabase{
  static Db db;
  static connect() async {
    const String MONGO_CONN_URL = "mongodb+srv://user:12345@attendance.kobg93v.mongodb.net/?retryWrites=true&w=majority";
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
}
}