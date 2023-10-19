import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String keyword;
  final VoidCallback onDelete; // Tambahkan parameter callback

  KeywordChip(this.keyword, {required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(keyword),
      onDeleted: () {
        onDelete(); // Panggil callback ketika chip dihapus
      },
    );
  }
}

