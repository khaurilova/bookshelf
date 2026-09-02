part of 'book_screen_bloc.dart';

@freezed
abstract class BookScreenState with _$BookScreenState {
  const factory BookScreenState.initial() = _Initial;
  const factory BookScreenState.loading() = _Loading;
  const factory BookScreenState.loaded({required LibraryBook book}) = _Loaded;
  const factory BookScreenState.notFound() = _NotFound;
  const factory BookScreenState.failure(String message) = _BookScreenFailure;
}
