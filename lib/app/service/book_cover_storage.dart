import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

typedef AppDirectoryProvider = Future<Directory> Function();

class BookCoverStorage {
  BookCoverStorage({AppDirectoryProvider? appDirectoryProvider})
    : _appDirectoryProvider =
          appDirectoryProvider ?? getApplicationDocumentsDirectory;

  static const _coversDirectoryName = 'covers';

  final AppDirectoryProvider _appDirectoryProvider;

  /// Copies a cover into app storage and returns its stable relative path.
  Future<String?> saveCover(String? sourcePath) async {
    if (sourcePath == null || sourcePath.isEmpty) {
      return null;
    }

    final cover = File(sourcePath);
    if (!await cover.exists()) {
      throw FileSystemException('Selected cover does not exist', sourcePath);
    }

    final appDirectory = await _appDirectoryProvider();
    final coversDirectory = Directory(
      p.join(appDirectory.path, _coversDirectoryName),
    );
    await coversDirectory.create(recursive: true);
    final originalName = p.basenameWithoutExtension(cover.path);
    final extension = p.extension(cover.path);
    final timestamp = DateTime.now().microsecondsSinceEpoch;

    final uniqueName = '${originalName}_$timestamp$extension';
    final destinationPath = p.join(coversDirectory.path, uniqueName);
    await cover.copy(destinationPath);

    return p.join(_coversDirectoryName, uniqueName);
  }

  /// Resolves both current relative paths and legacy absolute paths.
  Future<File?> resolveCover(String? storedPath) async {
    if (storedPath == null || storedPath.isEmpty) {
      return null;
    }

    final storedFile = File(storedPath);
    if (p.isAbsolute(storedPath) && await storedFile.exists()) {
      return storedFile;
    }

    final appDirectory = await _appDirectoryProvider();
    final relativePath = p.isAbsolute(storedPath)
        ? p.join(_coversDirectoryName, p.basename(storedPath))
        : storedPath;
    final resolvedFile = File(p.join(appDirectory.path, relativePath));

    return await resolvedFile.exists() ? resolvedFile : null;
  }
}
