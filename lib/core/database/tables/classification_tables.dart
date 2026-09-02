import 'package:drift/drift.dart';

import 'books_tables.dart';

/// User-defined labels such as "Favourite" or "Read later".
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();
  DateTimeColumn get createdAt => dateTime()();
}

/// A controlled classification used for genre-based statistics.
class Genres extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();
}

/// Join table for the many-to-many relation between books and tags.
class BookTags extends Table {
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId => integer().references(Tags, #id)();

  @override
  Set<Column<Object>> get primaryKey => {bookId, tagId};
}

/// Join table for the many-to-many relation between books and genres.
class BookGenres extends Table {
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  IntColumn get genreId => integer().references(Genres, #id)();

  @override
  Set<Column<Object>> get primaryKey => {bookId, genreId};
}
