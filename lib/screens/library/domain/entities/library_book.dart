class LibraryBook {
  final int? id;

  final String title;

  final String? author;

  final String? description;

  final String? coverPath;

  final String? epubPath;

  final double? rating;

  final String? dateStarted;

  final String? dateFinished;

  final String? status;

  final String createdAt;
  final double progress;

  const LibraryBook({
    this.id,
    required this.title,
    this.author,
    this.description,
    this.coverPath,
    this.epubPath,
    this.rating,
    this.dateStarted,
    this.dateFinished,
    this.status,
    required this.createdAt,
    required this.progress,
  });
}
