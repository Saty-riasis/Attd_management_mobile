import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
class DBConnection {

  static late DBConnection instance;

  final String _host = "DATABASE SERVER";
  final String _port = "DATABASE PORT";
  final String _dbName = "DATABASE NAME";
  late Db db;

  static getInstance(){
    instance ??= DBConnection();
    return instance;
  }

  Future<Db> getConnection() async{
    if (db == null){
      try {
        db = Db(_getConnectionString());
        await db.open();
      } catch(e){
        print(e);
      }
    }
    return db;
  }

  _getConnectionString(){
    return "mongodb+srv://user:12345@attendance.kobg93v.mongodb.net/?retryWrites=true&w=majority";
  }

  closeConnection() {
    db.close();
  }

}