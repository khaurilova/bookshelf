import 'dart:io';

import 'package:bookshelf/app/di/injection_container.dart';
import 'package:bookshelf/app/service/book_cover_storage.dart';
import 'package:flutter/material.dart';

class BookCoverImage extends StatefulWidget {
  const BookCoverImage({
    required this.coverPath,
    this.storage,
    this.fit = BoxFit.cover,
    super.key,
  });

  final String? coverPath;
  final BookCoverStorage? storage;
  final BoxFit fit;

  @override
  State<BookCoverImage> createState() => _BookCoverImageState();
}

class _BookCoverImageState extends State<BookCoverImage> {
  late Future<File?> _cover;

  BookCoverStorage get _storage => widget.storage ?? getIt<BookCoverStorage>();

  @override
  void initState() {
    super.initState();
    _cover = _storage.resolveCover(widget.coverPath);
  }

  @override
  void didUpdateWidget(covariant BookCoverImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.coverPath != widget.coverPath ||
        oldWidget.storage != widget.storage) {
      _cover = _storage.resolveCover(widget.coverPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: _cover,
      builder: (context, snapshot) {
        final cover = snapshot.data;
        if (cover == null) {
          return const Center(child: Icon(Icons.menu_book));
        }

        return Image.file(
          cover,
          fit: widget.fit,
          errorBuilder: (_, _, _) =>
              const Center(child: Icon(Icons.broken_image_outlined)),
        );
      },
    );
  }
}
