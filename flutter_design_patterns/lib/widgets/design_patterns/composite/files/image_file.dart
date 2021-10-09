import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/composite/files/file.dart';

class ImageFile extends File {
  const ImageFile({
    required String title,
    required int size,
  }) : super(
          title: title,
          size: size,
          icon: Icons.image,
        );
}
