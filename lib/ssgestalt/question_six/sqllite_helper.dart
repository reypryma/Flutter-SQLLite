import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'models/book.dart';
import 'models/rent.dart';

class DBConstant {
  static const String bookTable = 'book';
  static const String customerTable = 'customer';
  static const String rentTable = 'rent';
  static const int databaseVersion = 1;
}

class DatabaseHelper {
  static const String dbName = 'book_rental.db';
  // static Database? _database;

  late Future<Database> _database;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    print("location db saved in ${documentsDirectory.path}");
    final path = join(documentsDirectory.path, dbName);
    _database = openDatabase(
      path,
      version: DBConstant.databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBConstant.bookTable} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        price_rent INTEGER CHECK (price_rent > 0),
        book_category TEXT CHECK (book_category IN ('MANGA', 'NOVEL', 'MAGAZINE')),
        author VARCHAR(10) NULL -- Allow NULL values for author
      )
    ''');
    // Create the Customer table
    await db.execute('''
        CREATE TABLE ${DBConstant.customerTable} (
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          identity_card_number TEXT NOT NULL,
          address TEXT NULL -- Allow NULL values for address
        )
      ''');
    // Create the Rent table
    await db.execute('''
        CREATE TABLE ${DBConstant.rentTable} (
          id INTEGER PRIMARY KEY,
          customer_id INTEGER,
          book_id INTEGER,
          date_rent DATE NOT NULL,
          date_return DATE NULL, -- Allow NULL values for date_return
          FOREIGN KEY (customer_id) REFERENCES customer(id),
          FOREIGN KEY (book_id) REFERENCES book(id)
        )
      ''');
  }

  Future<List<Book>>? fetchListBook() async {
    final db = await _database;

    try {
      final List<Map<String, dynamic>> maps = await db.query(DBConstant.bookTable);
      if (maps.isNotEmpty) {
        return List.generate(maps.length, (i) {
          return Book(
            id: maps[i]['id'],
            title: maps[i]['title'],
            author: maps[i]['author'],
            priceRent: (maps[i]['price_rent'] as int).toDouble(),
            bookCategory: maps[i]['book_category'],
          );
        });
      } else {
        return [];
      }
    } catch (e) {
      // Handle the error here, e.g., log the error or return an empty list
     throw('Error SQLLIT fetching book data: $e');
    }
  }

  Future initListBook() async{
    final db = await _database;

    // Insert sample data into the book table
    await db.insert(
      DBConstant.bookTable,
      {
        'title': 'Book Manga',
        'price_rent': 3000, // Price in rupiah
        'book_category': 'MANGA',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.bookTable,
      {
        'title': 'Book Novel',
        'price_rent': 5000, // Price in rupiah
        'book_category': 'NOVEL',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.bookTable,
      {
        'title': 'Book Novel',
        'price_rent': 7000, // Price in rupiah
        'book_category': 'MAGAZINE',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );


    /*
    * INSERT CUSTOMER
    *
    * */

    await db.insert(
      DBConstant.customerTable,
      {
        'name': 'Customer 1',
        'identity_card_number': 'ID1',
        'address': 'Address 1',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.customerTable,
      {
        'name': 'Customer 2',
        'identity_card_number': 'ID2',
        'address': 'Address 2',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.customerTable,
      {
        'name': 'Customer 3',
        'identity_card_number': 'ID3',
        'address': 'Address 3',
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    /*
    * INSERT RENT
    *
    *
    * */
    final now = DateTime.now();

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      DBConstant.rentTable,
      {
        'customer_id': 1,
        'book_id': 1,
        'date_rent': now.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<List<Book>> fetchNotRentedBook() async {
    final db = await _database;
    print("fetch not rented books");

    try {
      final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM ${DBConstant.bookTable}
      LEFT JOIN ${DBConstant.rentTable} ON ${DBConstant.bookTable}.id = ${DBConstant.rentTable}.book_id
      WHERE ${DBConstant.rentTable}.id IS NULL
    ''');

      if (maps.isNotEmpty) {
        return List.generate(maps.length, (i) {
          return Book(
            id: maps[i]['id'],
            title: maps[i]['title'],
            author: maps[i]['author'],
            priceRent: (maps[i]['price_rent'] as int).toDouble(),
            bookCategory: maps[i]['book_category'],
          );
        });
      } else {
        return [];
      }
    } catch (e) {
      throw ('Error SQLLIT fetching not rented books: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchCustomersWithMoreThan10Rentals() async {
    final db = await _database;

    try {
      final List<Map<String, dynamic>> results = await db.rawQuery('''
      SELECT ${DBConstant.customerTable}.name AS customer_name,
             ${DBConstant.bookTable}.title AS book_title,
             COUNT(*) AS amount_borrowed_books
      FROM ${DBConstant.customerTable}
      INNER JOIN ${DBConstant.rentTable} ON ${DBConstant.customerTable}.id = ${DBConstant.rentTable}.customer_id
      INNER JOIN ${DBConstant.bookTable} ON ${DBConstant.rentTable}.book_id = ${DBConstant.bookTable}.id
      GROUP BY ${DBConstant.customerTable}.name, ${DBConstant.bookTable}.title
      HAVING COUNT(*) > 10
    ''');
      print(results);
      return results;
    } catch (e) {
      throw ('Error SQLLIT fetching customers with more than 10 rentals: $e');
    }
  }
}