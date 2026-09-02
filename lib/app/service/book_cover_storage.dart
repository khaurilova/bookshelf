import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class BookCoverStorage {
  Future<String> saveCover(String sourcePath) async {
    final cover = File(sourcePath);
    final appDirectory = await getApplicationDocumentsDirectory();
    final coversDirectory = Directory(p.join(appDirectory.path, 'covers'));
    await coversDirectory.create(recursive: true);
    final originalName = p.basenameWithoutExtension(cover.path);
    final extension = p.extension(cover.path);
    final timestamp = DateTime.now().microsecondsSinceEpoch;

    final uniqueName = '${originalName}_$timestamp$extension';
    final destinationPath = p.join(coversDirectory.path, uniqueName);
    final finalPath = await cover.copy(destinationPath);
    return finalPath.path;
  }
}
