import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/books_tables.dart';
import 'tables/classification_tables.dart';

part 'app_database.g.dart';

/// The single entry point to the local SQLite database.
///
/// Drift generates [_$AppDatabase] from this annotation and the table classes.
@DriftDatabase(
  tables: [
    Books,
    Quotes,
    ReadingSessions,
    Comments,
    Tags,
    Genres,
    BookTags,
    BookGenres,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// [executor] is injected by tests; the app uses the persistent database.
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  /// Creates the initial schema and reserves an explicit place for upgrades.
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      // Version 1 is the first released schema, so it has no upgrade path.
      // Every later schema change will add a guarded migration here.
    },
  );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'bookshelf',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
