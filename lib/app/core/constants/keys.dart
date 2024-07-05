class Keys {
  static const String sessionKey = 'sessionKey';
  static const String deviceId = 'deviceId';
  static const String accountId = 'accountId';
  static const String activationId = 'activationId';
  static const String didActivated = 'didActivated';
  static const String isDarkMode = 'isDarkMode';

  //
  static const String databaseName = 'my_database.sqlite';
  static const int databaseVersion = 1;

  static const String itemsTable = 'items';
  static const String categoriesTable = 'categories';

  static const String dropItemsTable = '''
    DROP TABLE IF EXISTS $itemsTable
  ''';

  static const String createItemsTable = '''
    CREATE TABLE IF NOT EXISTS $itemsTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      description TEXT,
      amount DOUBLE NOT NULL DEFAULT 0,
      dueDate TEXT,
      category TEXT,
      status INTEGER NOT NULL DEFAULT 0
    )
  ''';
}
