import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:price_list_pro/model/sqflite_model/ware_sqflite.dart';
import 'package:price_list_pro/model/ware.dart';
import 'package:price_list_pro/provider/ware_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';



const String tableCustomName = 'wareTable';
const String groupTable = 'groupProduct';
const List<String> columns=['wareName','unit','groupName','description','cost','sale','quantity','date','wareID'];

const integerType = 'INTEGER NOT NULL';
const doubleType = 'FLOAT(4) NOT NULL';
// final boolType = 'BOOLEAN NOT NULL';
const textType = 'TEXT NOT NULL';

class WareDB {
  static final WareDB instance = WareDB._init();

  static Database? _database;
  WareDB._init();
  Future<Database> get database async {
    if (_database != null) {
     await _database!.execute('''
    CREATE TABLE IF NOT EXISTS $tableCustomName (
    ${columns[0]} $textType,
    ${columns[1]} $textType,
    ${columns[2]} $textType,
    ${columns[3]} $textType,
    ${columns[4]} $doubleType,
    ${columns[5]} $doubleType,
    ${columns[6]} $doubleType,
    ${columns[7]} $textType,
    ${columns[8]} $textType
    )
    ''');
      return _database!;
    }
    _database = await _initDB('price_list_data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print(path);
    return openDatabase(path, version: 1, onCreate: _createDB);

  }

  Future _createDB(Database db, int version) async {


    await db.execute('''
    CREATE TABLE $tableCustomName (
    ${columns[0]} $textType,
    ${columns[1]} $textType,
    ${columns[2]} $textType,
    ${columns[3]} $textType,
    ${columns[4]} $doubleType,
    ${columns[5]} $doubleType,
    ${columns[6]} $doubleType,
    ${columns[7]} $textType,
    ${columns[8]} $textType
    )
    ''');
print("object");

  }

  Future<WareSqflite> create(WareSqflite wareSqflite) async {
    final db = await instance.database;
    await db.insert(tableCustomName, wareSqflite.toMap());
    return wareSqflite;
  }

  Future<WareSqflite> readData(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCustomName,
      columns: columns,
      where: "wareID = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return WareSqflite.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
  Future<List<WareSqflite>> readAllData(BuildContext context) async {
    final db = await instance.database;
    final result = await db.query(tableCustomName);
    ///in here we get group list of product to show on group drop down list
    ///and we use toSet() to remove repeated group names
    // ignore: use_build_context_synchronously
    Provider.of<WareProvider>(context,listen: false).groupList=result.map((json) =>json["groupName"]).toList().toSet().toList();
    return result.map((json) => WareSqflite.fromMap(json)).toList() ;

  }
  Future<List>
  readAllGroupList() async {
    final db = await instance.database;
    final result = await db.query(tableCustomName);
    //in here you get the all group name add to list and by using 'toSet' we delete the repeated words.
    return result.map((json) =>json["groupName"] as String).toList().toSet().toList();

  }



  Future<int> update(WareSqflite ware) async {
    final db = await instance.database;
    return db.update(
      tableCustomName,
      ware.toMap(),
      where: 'wareID = ?',
      whereArgs: [ware.wareID],
    );
  }

  Future<int> delete(String id) async {
    final db = await instance.database;
    return await db.delete(
      tableCustomName,
      where: 'wareID = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close;
  }
}