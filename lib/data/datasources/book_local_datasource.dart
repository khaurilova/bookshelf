import 'package:bookshelf/core/database/app_database.dart';
import 'package:drift/drift.dart';

class BookLocalDataSource {
  final AppDatabase database;

  BookLocalDataSource({required this.database});

  Future<int> insertBook(BooksCompanion book) {
    return database.into(database.books).insert(book);
  }

  Future<List<Book>> getBooks() async {
    final books = await database.select(database.books).get();
    return books;
  }

  Future<List<Book>> searchBook({required String query}) async {
    final books = database.select(database.books)
      ..where(
        (book) => book.title.contains(query) | book.author.contains(query),
      );
    return await books.get();
  }

  Future<Book?> getBookById({required int bookId}) {
    return (database.select(database.books)
          ..where((table) => table.id.equals(bookId)))
        .getSingleOrNull();
  }

  Stream<List<Book>> watchBooks() {
    return database.select(database.books).watch();
  }
}
