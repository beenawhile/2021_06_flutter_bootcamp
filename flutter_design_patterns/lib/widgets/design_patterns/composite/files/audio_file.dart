import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/composite/files/file.dart';

class AudioFile extends File {
  const AudioFile({
    required String title,
    required int size,
  }) : super(
          size: size,
          title: title,
          icon: Icons.music_note,
        );
}
