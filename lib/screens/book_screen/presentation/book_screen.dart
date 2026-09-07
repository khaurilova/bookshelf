import 'package:bookshelf/screens/book_screen/bloc/book_screen_bloc.dart';
import 'package:bookshelf/screens/library/widgets/book_cover_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class BookScreen extends StatefulWidget {
  final int bookId;
  const BookScreen({super.key, required this.bookId});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final bool _isVertical = false;
  @override
  void initState() {
    super.initState();
    context.read<BookScreenBloc>().add(
      BookScreenEvent.started(bookId: widget.bookId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<BookScreenBloc, BookScreenState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(child: CircularProgressIndicator());
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (book) => Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BookCoverImage(
                                  coverPath: book.coverPath,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              Text(book.title),
                              book.author == null || book.author!.isEmpty
                                  ? SizedBox.shrink()
                                  : Text(book.author!),
                              RatingBarIndicator(
                                rating: book.rating ?? 0,
                                itemCount: 5,
                                itemBuilder: (context, _) =>
                                    Icon(Icons.star, color: Colors.amber),
                                direction: _isVertical
                                    ? Axis.vertical
                                    : Axis.horizontal,
                              ),

                              // Row(
                              //   children: [
                              //     ...(book.rating == null
                              //         ? List.generate(
                              //             5,
                              //             (_) => const Icon(Icons.star_border),
                              //           )
                              //         : List.generate(5, (index) {
                              //             final isFilled = index < book.rating!;

                              //             return Icon(
                              //               isFilled
                              //                   ? Icons.star
                              //                   : Icons.star_border,
                              //               color: Colors.amber,
                              //             );
                              //           })),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            notFound: () => const Center(child: Text('Book not found')),
            failure: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
