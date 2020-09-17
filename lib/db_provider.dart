import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model/field.dart';

class DatabaseProvider {
  static const String Table_Field = "fields";
  static const String Column_DataField = "data field";
  static const String Column_Name = "name";
  static const String Column_FatherName = "father name";
  static const String Column_AadharNumber = "aadhar number";
  static const String Column_Address = "address";
  static const String Column_FamilyDetails = "family details";
  static const String Column_Origin = "origin";
  static const String Column_Destination = "destination";
  static const String Column_Route = "route";
  static const String Column_LivestockDetails = "livestock details";
  static const String Column_MonthlyIncome = "monthly income";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("dataase getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return openDatabase(join(dbPath, "fieldDB.db"), version: 1,
        onCreate: (Database databse, int version) async {
      print("creating field table");

      await databse.execute("CREATE TABLE $Table_Field ("
          "COLUMN_DATAFIELD INTEGER PRIMARY KEY,"
          "COLUMN_NAME TEXT,"
          "COLUMN_FATHERNAME TEXT,"
          "COLUMN_AADHARNUMBER TEXT,"
          "COLUMN_ADDRESS TEXT,"
          "COLUMN_FAMILYDETAIL TEXT,"
          "COLUMN_ORIGIN TEXT,"
          "COLUMN_DESTINATION TEXT,"
          "COLUMN_ROUTE TEXT,"
          "COLUMN_LIVESTOCK TEXT,"
          "COLUMN_MONTHLYINCOME TEXT,"
          ")");
    });
  }

  Future<List<Field>> getField() async {
    final db = await database;

    var field = db.query(Table_Field, columns: [
      Column_DataField,
      Column_Name,
      Column_FatherName,
      Column_AadharNumber,
      Column_Address,
      Column_FamilyDetails,
      Column_Origin,
      Column_Destination,
      Column_Route,
      Column_LivestockDetails,
      Column_MonthlyIncome
    ]);

    List<Field> fieldList = List<Field>();

    var currentField;
    for (currentField in fieldList) {
      Field field = Field.fromMap(currentField);
      fieldList.add(field);
    }
    return fieldList;
  }

  Future<Field> insert(Field field) async {
    final db = await database;
    field.datafield = await db.insert(Table_Field, field.toMap());
    return field;
  }

  Future<int> delete(int datafield) async {
    final db = await database;

    return await db.delete(
      Table_Field,
      where: "datafield = ?",
      whereArgs: [datafield],
    );
  }

  Future<int> update(Field field) async {
    final db = await database;

    return await db.update(
      Table_Field,
      field.toMap(),
      where: "datafield = ?",
      whereArgs: [field.datafield],
    );
  }
}
