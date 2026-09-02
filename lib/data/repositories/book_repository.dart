import 'package:bookshelf/core/database/app_database.dart';
import 'package:drift/drift.dart';

import '../datasources/book_local_datasource.dart';
import '../../screens/library/domain/entities/library_book.dart';

class BookRepository {
  final BookLocalDataSource localDataSource;

  BookRepository({required this.localDataSource});

  Future<void> addBook(LibraryBook book) async {
    await localDataSource.insertBook(_toBooksCompanion(book));
  }

  Future<List<LibraryBook>> getBooks() async {
    final books = await localDataSource.getBooks();
    return books.map(_toLibraryBook).toList();
  }

  Future<LibraryBook?> getBookById({required int bookId}) async {
    final book = await localDataSource.getBookById(bookId: bookId);
    return book == null ? null : _toLibraryBook(book);
  }

  Future<List<LibraryBook>> searchBook({required String query}) async {
    final books = await localDataSource.searchBook(query: query);
    return books.map(_toLibraryBook).toList();
  }

  LibraryBook _toLibraryBook(Book book) {
    return LibraryBook(
      id: book.id,
      title: book.title,
      author: book.author,
      description: book.description,
      coverPath: book.coverPath,
      epubPath: book.epubPath,
      rating: book.rating,
      dateStarted: book.startedAt?.toIso8601String(),
      dateFinished: book.finishedAt?.toIso8601String(),
      status: book.status,
      createdAt: book.createdAt.toIso8601String(),
      progress: book.progressPercent,
    );
  }

  BooksCompanion _toBooksCompanion(LibraryBook book) {
    return BooksCompanion.insert(
      title: book.title,
      author: Value(book.author),
      description: Value(book.description),
      coverPath: Value(book.coverPath),
      epubPath: Value(book.epubPath),
      rating: Value(book.rating),
      status: Value(
        book.status ?? 'planned',
      ), //TODO : do not forget this status
      startedAt: Value(_parseNullableDate(book.dateStarted)),
      finishedAt: Value(_parseNullableDate(book.dateFinished)),
      createdAt: DateTime.parse(book.createdAt),
      updatedAt: DateTime.now(),
      progressPercent: Value(book.progress),
    );
  }

  DateTime? _parseNullableDate(String? value) {
    return value == null ? null : DateTime.parse(value);
  }

  Stream<List<LibraryBook>> watchBooks() {
    return localDataSource.watchBooks().map(
      (books) => books.map(_toLibraryBook).toList(),
    );
  }
}
