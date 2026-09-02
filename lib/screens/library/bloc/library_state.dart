part of 'library_bloc.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = _Initial;
  const factory LibraryState.loading() = _Loading;
  const factory LibraryState.loaded({
    required List<LibraryBook> books,
    required String searchQuery,
  }) = _Loaded;
  const factory LibraryState.failure(String message) = _LibraryFailure;
}
