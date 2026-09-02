import 'package:bookshelf/screens/library/bloc/library_bloc.dart';
import 'package:bookshelf/screens/library/domain/entities/library_book.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBookPopUp extends StatefulWidget {
  const AddBookPopUp({super.key});

  @override
  State<AddBookPopUp> createState() => _AddBookPopUpState();
}

// class AddBookFormData {
//   const AddBookFormData({
//     required this.title,
//     required this.status,
//     this.author,
//     this.startedAt,
//   });

//   final String title;
//   final String? author;
//   final String status;
//   final DateTime? startedAt;
// }

class _AddBookPopUpState extends State<AddBookPopUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedStatus = 'reading';
  DateTime? _startedAt;
  String _title = '';
  String? _author;
  String? _coverPath;

  Future<void> _pickCover() async {
    final cover = await FilePicker.pickFile(type: FileType.image);
    final selectedPath = cover?.path;

    if (selectedPath == null || !mounted) {
      return;
    }

    setState(() {
      _coverPath = selectedPath;
    });
  }

  Future<void> _selectStartedAt() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _startedAt ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (selectedDate == null || !mounted) {
      return;
    }

    setState(() {
      _startedAt = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Center(
                  child: TextButton(
                    onPressed: _pickCover,
                    child: Text('pich cover'),
                  ),
                ),
                TextFormField(
                  onSaved: (value) {
                    _title = value!.trim();
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Name of the book',
                    border: UnderlineInputBorder(borderSide: BorderSide()),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter books name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (value) {
                    final author = value?.trim();
                    _author = author?.isEmpty ?? true ? null : author;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Author',
                    border: UnderlineInputBorder(borderSide: BorderSide()),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status'),
                    DropdownMenu(
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      initialSelection: 'reading',
                      onSelected: (status) {
                        if (status == null) {
                          return;
                        }

                        setState(() {
                          _selectedStatus = status;

                          if (_selectedStatus != 'reading') {
                            _startedAt = null;
                          }
                        });
                      },
                      dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: 'reading', label: 'reading'),
                        DropdownMenuEntry(value: 'planned', label: 'planned'),
                        DropdownMenuEntry(value: 'finished', label: 'finished'),
                      ],
                    ),
                  ],
                ),
                if (_selectedStatus == 'reading')
                  TextButton.icon(
                    onPressed: _selectStartedAt,
                    icon: const Icon(Icons.calendar_today_outlined),
                    label: Text(
                      _startedAt == null
                          ? 'Select start date'
                          : MaterialLocalizations.of(
                              context,
                            ).formatMediumDate(_startedAt!),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      final isValid =
                          _formKey.currentState?.validate() ?? false;

                      if (!isValid) {
                        return;
                      }
                      _formKey.currentState!.save();
                      final formData = LibraryBook(
                        title: _title,
                        author: _author,
                        status: _selectedStatus,
                        dateStarted: _startedAt?.toIso8601String(),
                        createdAt: DateTime.now().toIso8601String(),
                        progress: 0,
                        coverPath: _coverPath,
                      );

                      Navigator.of(context).pop(formData);
                    },
                    child: Text('Add book'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
