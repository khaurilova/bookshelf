part of 'book_screen_bloc.dart';

@freezed
abstract class BookScreenEvent with _$BookScreenEvent {
  const factory BookScreenEvent.started({required int bookId}) = _Started;
}
