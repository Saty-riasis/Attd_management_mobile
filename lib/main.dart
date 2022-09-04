import 'package:attd_management/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'connections/DbConnection.dart';


  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MongoDatabase.connect();
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
  }
