import 'dart:io';

import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final LibraryBook book;
  final Function(LibraryBook) onTap;
  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final coverPath = book.coverPath;
    return InkWell(
      onTap: () => onTap(book),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              color: Colors.grey.shade200,
              child: SizedBox.expand(
                child: coverPath == null || coverPath.isEmpty
                    ? const Center(child: Icon(Icons.menu_book))
                    : Image.file(
                        File(coverPath),
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return const Center(
                            child: Icon(Icons.broken_image_outlined),
                          );
                        },
                      ),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${book.progress.round()}%'),
                  Text(book.status ?? ''),
                ],
              ),
              LinearProgressIndicator(
                value: (book.progress / 100).clamp(0.0, 1.0).toDouble(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
