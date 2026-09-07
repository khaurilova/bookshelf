import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:bookshelf/screens/library/widgets/book_cover_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final LibraryBook book;
  final Function(LibraryBook) onTap;
  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
                child: BookCoverImage(coverPath: book.coverPath),
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
