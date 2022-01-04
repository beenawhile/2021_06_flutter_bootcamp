import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/file.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

class TextFile extends File {
  final String content;

  const TextFile({
    required String title,
    required this.content,
    required String fileExtension,
    required int size,
  }) : super(
          title: title,
          fileExtension: fileExtension,
          size: size,
          icon: Icons.description,
        );

  @override
  String accept(IVisitor visitor) {
    return visitor.visitTextFile(this);
  }
}
