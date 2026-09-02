import 'package:bookshelf/app/di/injection_container.dart';
import 'package:bookshelf/screens/book_screen/bloc/book_screen_bloc.dart';
import 'package:bookshelf/screens/library/bloc/library_bloc.dart';
import 'package:bookshelf/screens/book_screen/presentation/book_screen.dart';
import 'package:bookshelf/screens/library/presentation/library_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<LibraryBloc>()..add(const LibraryEvent.started()),
        child: const LibraryScreen(),
      ),
    ),
    GoRoute(
      path: '/books/:bookId',
      builder: (context, state) {
        final bookId = int.parse(state.pathParameters['bookId']!);
        return BlocProvider(
          create: (_) => getIt<BookScreenBloc>(),
          child: BookScreen(bookId: bookId),
        );
      },
    ),
  ],
);
