import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:price_list_pro/model/sqflite_model/customer_sqflite.dart';
import 'package:sqflite/sqflite.dart';


const String tableCustomName = 'customerTable';
const List<String> columns=['firstName','lastName','nickName','phoneNumber','phoneNumber2','description','date','score','customerId'];
// const integerType = 'INTEGER NOT NULL';
const doubleType = 'FLOAT(4) NOT NULL';
// final boolType = 'BOOLEAN NOT NULL';
const textType = 'TEXT NOT NULL';





class CustomerDB {
  static final CustomerDB instance = CustomerDB._init();

  static Database? _database;
  CustomerDB._init();
  Future<Database> get database async {
    if (_database != null) {
     await _database!.execute('''
    CREATE TABLE IF NOT EXISTS $tableCustomName (
    ${columns[0]} $textType,
    ${columns[1]} $textType,
    ${columns[2]} $textType,
    ${columns[3]} $textType,
    ${columns[4]} $textType,
    ${columns[5]} $textType,
    ${columns[6]} $textType,
    ${columns[7]} $doubleType,
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
    return openDatabase(path, version: 1, onCreate: _createDB);

  }

  Future _createDB(Database db, int version) async {


    await db.execute('''
    CREATE TABLE $tableCustomName (
    ${columns[0]} $textType,
    ${columns[1]} $textType,
    ${columns[2]} $textType,
    ${columns[3]} $textType,
    ${columns[4]} $textType,
    ${columns[5]} $textType,
    ${columns[6]} $textType,
    ${columns[7]} $doubleType,
    ${columns[8]} $textType
    )
    ''');
  }

  Future<CustomerSqflite> create(CustomerSqflite customerSqflite) async {
    final db = await instance.database;
    await db.insert(tableCustomName, customerSqflite.toMap());
    return customerSqflite;
  }

  Future<CustomerSqflite> readData(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCustomName,
      columns: columns,
      where: "customerID = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return CustomerSqflite.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
  Future<List<CustomerSqflite>> readAllData(BuildContext context) async {
    final db = await instance.database;
    final result = await db.query(tableCustomName);
    return result.map((json) => CustomerSqflite.fromMap(json)).toList() ;

  }


  Future<int> update(CustomerSqflite customerSqflite) async {
    final db = await instance.database;
    return db.update(
      tableCustomName,
      customerSqflite.toMap(),
      where: 'customerId = ?',
      whereArgs: [customerSqflite.customerId],
    );
  }

  Future<int> delete(String id) async {
    final db = await instance.database;
    return await db.delete(
      tableCustomName,
      where: 'customerId = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close;
  }
}