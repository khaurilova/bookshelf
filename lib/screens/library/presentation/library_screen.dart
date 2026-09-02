import 'package:bookshelf/screens/library/bloc/library_bloc.dart';
import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:bookshelf/screens/library/widgets/add_book_pop_up.dart';
import 'package:bookshelf/screens/library/widgets/custom_grid_view.dart';
import 'package:bookshelf/screens/library/widgets/library_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My library'), centerTitle: false),
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(child: CircularProgressIndicator());
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (books, searchQuery) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: Text('${books.length} books'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LibrarySearchField(
                      initialQuery: searchQuery,
                      onChanged: (query) {
                        context.read<LibraryBloc>().add(
                          LibraryEvent.searchQueryChanged(query),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: books.isEmpty
                        ? Center(
                            child: Text(
                              searchQuery.isEmpty
                                  ? 'Your library is empty'
                                  : 'No books found',
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomGridView(books: books),
                          ),
                  ),
                ],
              );
            },
            failure: (message) {
              return Center(child: Text(message));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final formData = await showDialog<LibraryBook>(
            context: context,
            builder: (_) => const AddBookPopUp(),
          );

          if (formData == null) {
            return;
          }
          context.read<LibraryBloc>().add(
            LibraryEvent.uploadBook(
              title: formData.title,
              author: formData.author,
              status: formData.status ?? "reading",
              startedAt: formData.dateStarted,
              createdAt: formData.createdAt,
              progress: formData.progress,
              coverPath: formData.coverPath,
            ),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
