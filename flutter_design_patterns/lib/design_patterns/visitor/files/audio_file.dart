import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/file.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

class AudioFile extends File {
  final String albumTitle;

  const AudioFile({
    required String title,
    required this.albumTitle,
    required String fileExtension,
    required int size,
  }) : super(
          title: title,
          fileExtension: fileExtension,
          size: size,
          icon: Icons.music_note,
        );

  @override
  String accept(IVisitor visitor) {
    return visitor.visitAudioFile(this);
  }
}
