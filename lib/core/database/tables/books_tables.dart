import 'package:drift/drift.dart';

/// Stores the library card and the current reading progress for each book.
class Books extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
  TextColumn get author => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get coverPath => text().nullable()();
  TextColumn get epubPath => text().nullable()();
  RealColumn get rating => real().nullable()();

  /// A string enum: planned, reading, finished, or abandoned.
  TextColumn get status => text().withDefault(const Constant('planned'))();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get finishedAt => dateTime().nullable()();

  /// An EPUB-reader-specific position, not a screen-dependent page number.
  TextColumn get currentLocator => text().nullable()();
  TextColumn get currentChapterTitle => text().nullable()();
  RealColumn get progressPercent => real().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

/// Stores text that the user selected while reading a book.
class Quotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  TextColumn get quoteText => text().named('text')();
  TextColumn get note => text().nullable()();
  TextColumn get chapterTitle => text().nullable()();
  TextColumn get startLocator => text().nullable()();
  TextColumn get endLocator => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

/// Records one completed reading interval for later statistics.
class ReadingSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime()();
  IntColumn get durationSeconds => integer()();
  RealColumn get progressBefore => real()();
  RealColumn get progressAfter => real()();
  IntColumn get pagesRead => integer().withDefault(const Constant(0))();
}

/// Stores both book-level comments and comments attached to a text location.
class Comments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get bookId =>
      integer().references(Books, #id, onDelete: KeyAction.cascade)();
  TextColumn get commentText => text().named('text')();
  TextColumn get locator => text().nullable()();
  TextColumn get chapterTitle => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
