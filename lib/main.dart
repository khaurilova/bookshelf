import 'package:bookshelf/app/di/injection_container.dart';
import 'package:bookshelf/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
