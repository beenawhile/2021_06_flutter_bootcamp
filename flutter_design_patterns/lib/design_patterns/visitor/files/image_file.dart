import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/file.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

class ImageFile extends File {
  final String resolution;
  const ImageFile({
    required String title,
    required this.resolution,
    required String fileExtension,
    required int size,
  }) : super(
          title: title,
          fileExtension: fileExtension,
          size: size,
          icon: Icons.image,
        );

  @override
  String accept(IVisitor visitor) {
    return visitor.visitImageFile(this);
  }
}
