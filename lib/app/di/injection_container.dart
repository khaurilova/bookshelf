import 'package:bookshelf/app/service/book_cover_storage.dart';
import 'package:bookshelf/core/database/app_database.dart';
import 'package:bookshelf/data/datasources/book_local_datasource.dart';
import 'package:bookshelf/data/repositories/book_repository.dart';
import 'package:bookshelf/screens/book_screen/bloc/book_screen_bloc.dart';
import 'package:bookshelf/screens/library/bloc/library_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<AppDatabase>(AppDatabase.new);

  getIt.registerLazySingleton<BookLocalDataSource>(
    () => BookLocalDataSource(database: getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<BookRepository>(
    () => BookRepository(localDataSource: getIt<BookLocalDataSource>()),
  );
  getIt.registerLazySingleton<BookCoverStorage>(() => BookCoverStorage());

  getIt.registerFactory<LibraryBloc>(
    () => LibraryBloc(
      repository: getIt<BookRepository>(),
      bookCoverStorage: getIt<BookCoverStorage>(),
    ),
  );

  getIt.registerFactory<BookScreenBloc>(
    () => BookScreenBloc(getIt<BookRepository>()),
  );
}
