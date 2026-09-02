import 'package:flutter/material.dart';

class LibrarySearchField extends StatelessWidget {
  final String initialQuery;
  final ValueChanged<String> onChanged;
  const LibrarySearchField({
    super.key,
    required this.initialQuery,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialQuery,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Search books...',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Color.fromARGB(255, 224, 224, 224),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
