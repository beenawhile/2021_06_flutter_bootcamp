import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/file.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

class VideoFile extends File {
  final String directedBy;

  const VideoFile({
    required String title,
    required this.directedBy,
    required String fileExtension,
    required int size,
  }) : super(
          title: title,
          fileExtension: fileExtension,
          size: size,
          icon: Icons.movie,
        );

  @override
  String accept(IVisitor visitor) {
    return visitor.visitVideoFile(this);
  }
}
