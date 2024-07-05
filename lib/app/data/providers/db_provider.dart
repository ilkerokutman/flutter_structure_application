import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_structure_application/app/core/constants/keys.dart';
import 'package:flutter_structure_application/app/data/models/item_model.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  DbProvider._();

  /// Singleton instance of the [DbProvider] class.
  static final DbProvider db = DbProvider._();

  Database? _database;

  /// Getter for the database instance.
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  /// Initializes the database.
  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, Keys.databaseName);
    if (kDebugMode) {
      print(path);
    }
    return await openDatabase(
      path,
      version: Keys.databaseVersion,
      onCreate: _onCreateDb,
      onUpgrade: _onUpgradeDb,
      singleInstance: true,
      readOnly: false,
    );
  }

  _onCreateDb(Database db, int version) async {
    await db.execute(Keys.dropItemsTable);
    await db.execute(Keys.createItemsTable);
  }

  _onUpgradeDb(Database db, int oldVersion, int newVersion) async {
    await db.execute(Keys.dropItemsTable);
    await db.execute(Keys.createItemsTable);
  }

  /// Inserts an [ItemDefinition] into the database.
  ///
  /// The [item] parameter is the [ItemDefinition] object to be inserted.
  ///
  /// Returns the number of rows affected by the insertion. If the database is null,
  /// returns -2. If an error occurs during the insertion, returns -1 and prints
  /// the error to the console.
  Future<int> insertItem({required ItemDefinition item}) async {
    final db = await database;
    if (db == null) return -2;
    try {
      int result = await db.insert(
        Keys.itemsTable,
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return -1;
    }
  }

  /// Deletes an item from the database based on the provided [id].
  ///
  /// The [id] parameter is the unique identifier of the item to be deleted.
  ///
  /// Returns the number of rows affected by the deletion. If the database is null,
  /// returns -2. If an error occurs during the deletion, returns -1 and prints
  /// the error to the console.
  Future<int> deleteItem({required int id}) async {
    final db = await database;
    if (db == null) return -2;
    try {
      int result = await db.delete(
        Keys.itemsTable,
        where: 'id = ?',
        whereArgs: [id],
      );
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return -1;
    }
  }

  /// Updates an item in the database with the provided [item].
  ///
  /// The [item] parameter is the [ItemDefinition] object to be updated.
  ///
  /// Returns the number of rows affected by the update. If the database is null,
  /// returns -2. If an error occurs during the update, returns -1 and prints
  /// the error to the console.
  Future<int> updateItem({required ItemDefinition item}) async {
    final db = await database;
    if (db == null) return -2;
    try {
      int result = await db.update(
        Keys.itemsTable,
        item.toMap(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
      return result;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return -1;
    }
  }

  /// Retrieves a list of [ItemDefinition] objects from the database.
  ///
  /// The [categoryFilter] parameter is an optional string that filters the
  /// results by a specific category. If provided, only items with a matching
  /// category will be returned.
  ///
  /// Returns a [Future] that completes with a list of [ItemDefinition]
  /// objects. If the database is null, an empty list is returned. If an error
  /// occurs during the retrieval, an empty list is returned and the error is
  /// printed to the console.
  Future<List<ItemDefinition>> getItems({String? categoryFilter}) async {
    final result = <ItemDefinition>[];
    final db = await database;
    if (db == null) return [];
    try {
      final List<Map<String, dynamic>> maps = categoryFilter != null
          ? await db.query(
              Keys.itemsTable,
              where: 'category = ?',
              whereArgs: [categoryFilter],
            )
          : await db.query(Keys.itemsTable);
      result.assignAll(maps.map((e) => ItemDefinition.fromMap(e)));
      return result;
    } catch (e) {
      return [];
    }
  }

  /// Retrieves an [ItemDefinition] object from the database based on the provided [id].
  ///
  /// The [id] parameter is the unique identifier of the item to be retrieved.
  ///
  /// Returns a [Future] that completes with the [ItemDefinition] object if found, or `null` if not found or an error occurs.
  /// If the database is null, `null` is returned.
  Future<ItemDefinition?> getItemById({required int id}) async {
    final db = await database;
    if (db == null) return null;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        Keys.itemsTable,
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isEmpty) return null;
      return ItemDefinition.fromMap(maps.first);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
