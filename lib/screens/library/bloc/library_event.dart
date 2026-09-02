part of 'library_bloc.dart';

@freezed
class LibraryEvent with _$LibraryEvent {
  const factory LibraryEvent.started() = _Started;
  const factory LibraryEvent.booksUpdated(List<LibraryBook> books) =
      _BooksUpdated;
  const factory LibraryEvent.failed(String message) = _BooksLoadFailed;
  const factory LibraryEvent.searchQueryChanged(String query) =
      _SearchQueryChanged;
  const factory LibraryEvent.uploadBook({
    required String title,
    String? author,
    required String status,
    String? startedAt,
    required String createdAt,
    required double progress,
    String? coverPath,
  }) = _UploadBook;
}
