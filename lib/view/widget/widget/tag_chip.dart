/* 커스텀 태그 칩 위젯 */

import 'package:flutter/material.dart';

/// class
class FWTagChip extends StatelessWidget {
  const FWTagChip({
    Key? key,
    required this.label,
    required this.onDeleted,
    required this.index,
  }) : super(key: key);

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(Icons.close, size: 18.0),
      onDeleted: () => onDeleted(index),
    );
  }
}