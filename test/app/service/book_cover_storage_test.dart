import 'dart:io';

import 'package:bookshelf/app/service/book_cover_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  group('BookCoverStorage', () {
    late Directory temporaryDirectory;
    late Directory appDirectory;
    late BookCoverStorage storage;

    setUp(() async {
      temporaryDirectory = await Directory.systemTemp.createTemp(
        'book_cover_storage_test_',
      );
      appDirectory = Directory(p.join(temporaryDirectory.path, 'app'));
      await appDirectory.create();
      storage = BookCoverStorage(
        appDirectoryProvider: () async => appDirectory,
      );
    });

    tearDown(() => temporaryDirectory.delete(recursive: true));

    test('saves a cover using a relative path', () async {
      final source = File(p.join(temporaryDirectory.path, 'cover.png'));
      await source.writeAsBytes([1, 2, 3]);

      final storedPath = await storage.saveCover(source.path);

      expect(p.isAbsolute(storedPath!), isFalse);
      expect(p.dirname(storedPath), 'covers');
      expect(
        await File(p.join(appDirectory.path, storedPath)).exists(),
        isTrue,
      );
    });

    test('resolves a relative cover path', () async {
      final cover = File(p.join(appDirectory.path, 'covers', 'cover.png'));
      await cover.parent.create(recursive: true);
      await cover.writeAsBytes([1, 2, 3]);

      final resolved = await storage.resolveCover('covers/cover.png');

      expect(resolved?.path, cover.path);
    });

    test('repairs a legacy absolute path using its file name', () async {
      final cover = File(p.join(appDirectory.path, 'covers', 'cover.png'));
      await cover.parent.create(recursive: true);
      await cover.writeAsBytes([1, 2, 3]);

      final resolved = await storage.resolveCover(
        p.join('/old', 'container', 'Documents', 'covers', 'cover.png'),
      );

      expect(resolved?.path, cover.path);
    });

    test('returns null when no cover was selected', () async {
      expect(await storage.saveCover(null), isNull);
      expect(await storage.saveCover(''), isNull);
    });
  });
}
