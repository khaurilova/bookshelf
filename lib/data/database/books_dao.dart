import 'package:bookshelf/core/database/app_database.dart';

class BooksDao {
  final AppDatabase database;
  BooksDao({required this.database});

  Stream<List<Book>> watchAllBooks() {
    return database.select(database.books).watch();
  }
}
