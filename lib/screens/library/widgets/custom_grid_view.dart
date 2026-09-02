import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:bookshelf/screens/library/widgets/book_card.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CustomGridView extends StatelessWidget {
  final List<LibraryBook> books;

  const CustomGridView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];

          return BookCard(
            book: book,
            onTap: (book) {
              final bookId = book.id;

              if (bookId == null) {
                return;
              }

              context.push('/books/$bookId');
            },
          );
        },
      ),
    );
  }
}
