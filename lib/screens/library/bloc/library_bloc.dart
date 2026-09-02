import 'dart:async';

import 'package:bookshelf/app/service/book_cover_storage.dart';
import 'package:bookshelf/data/repositories/book_repository.dart';
import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_event.dart';
part 'library_state.dart';
part 'library_bloc.freezed.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  LibraryBloc({required this._repository, required this.bookCoverStorage})
    : super(const LibraryState.initial()) {
    on<_Started>(_onStarted);
    on<_BooksUpdated>(_onBooksUpdated);
    on<_BooksLoadFailed>(_onBooksLoadFailed);
    on<_SearchQueryChanged>(_onSearchQueryChanged);
    on<_UploadBook>(_onUploadBook);
  }

  final BookRepository _repository;
  StreamSubscription<List<LibraryBook>>? _booksSubscription;
  final BookCoverStorage bookCoverStorage;

  Future<void> _onStarted(_Started event, Emitter<LibraryState> emit) async {
    emit(const LibraryState.loading());

    await _booksSubscription?.cancel();

    _booksSubscription = _repository.watchBooks().listen(
      (books) => add(LibraryEvent.booksUpdated(books)),
      onError: (Object error, StackTrace _) {
        add(LibraryEvent.failed(error.toString()));
      },
    );
  }

  List<LibraryBook> _allBooks = [];
  String _searchQuery = '';
  void _onBooksUpdated(_BooksUpdated event, Emitter<LibraryState> emit) {
    _allBooks = event.books;

    _emitFilteredBooks(emit);
    // emit(LibraryState.loaded(books: _allBooks, searchQuery: _searchQuery));
  }

  void _onSearchQueryChanged(
    _SearchQueryChanged event,
    Emitter<LibraryState> emit,
  ) {
    _searchQuery = event.query.trim();

    _emitFilteredBooks(emit);
    // final searchBook = await _repository.searchBook(query: event.query);
    // emit(LibraryState.loaded(books: searchBook, searchQuery: event.query));
  }

  List<LibraryBook> _filteredBooks() {
    final normalizedQuery = _searchQuery.toLowerCase();

    if (normalizedQuery.isEmpty) {
      return _allBooks;
    }

    return _allBooks.where((book) {
      final titleMatches = book.title.toLowerCase().contains(normalizedQuery);

      final authorMatches =
          book.author?.toLowerCase().contains(normalizedQuery) ?? false;

      return titleMatches || authorMatches;
    }).toList();
  }

  void _emitFilteredBooks(Emitter<LibraryState> emit) {
    emit(
      LibraryState.loaded(books: _filteredBooks(), searchQuery: _searchQuery),
    );
  }

  void _onBooksLoadFailed(_BooksLoadFailed event, Emitter<LibraryState> emit) {
    emit(LibraryState.failure(event.message));
  }

  void _onUploadBook(_UploadBook event, Emitter<LibraryState> emit) async {
    final coverPath = await bookCoverStorage.saveCover(event.coverPath ?? '');
    final book = LibraryBook(
      title: event.title,
      author: event.author,
      status: event.status,
      dateStarted: event.startedAt,
      createdAt: event.createdAt,
      progress: event.progress,
      coverPath: coverPath,
    );
    await _repository.addBook(book);
  }

  @override
  Future<void> close() async {
    await _booksSubscription?.cancel();
    return super.close();
  }
}
