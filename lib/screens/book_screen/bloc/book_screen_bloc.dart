import 'package:bookshelf/data/repositories/book_repository.dart';
import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_screen_event.dart';
part 'book_screen_state.dart';
part 'book_screen_bloc.freezed.dart';

class BookScreenBloc extends Bloc<BookScreenEvent, BookScreenState> {
  BookScreenBloc(this._repository) : super(const BookScreenState.initial()) {
    on<_Started>(_onStarted);
  }

  final BookRepository _repository;

  Future<void> _onStarted(
    _Started event,
    Emitter<BookScreenState> emit,
  ) async {
    emit(const BookScreenState.loading());

    try {
      final book = await _repository.getBookById(bookId: event.bookId);

      if (book == null) {
        emit(const BookScreenState.notFound());
        return;
      }

      emit(BookScreenState.loaded(book: book));
    } catch (_) {
      emit(const BookScreenState.failure('Failed to load book.'));
    }
  }
}
