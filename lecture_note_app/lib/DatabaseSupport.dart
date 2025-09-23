import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSupport{

  static final String databaseName = "lessons.sqlite";

  static Future<Database> databaseAccess() async{
    String databasePath = await join(await getDatabasesPath(), databaseName);

    if(await databaseExists(databasePath)){
      print("Database has already exist.");
    }else{
      ByteData data = await rootBundle.load("database/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Database is copied");
    }

    return openDatabase(databasePath);
  }
}