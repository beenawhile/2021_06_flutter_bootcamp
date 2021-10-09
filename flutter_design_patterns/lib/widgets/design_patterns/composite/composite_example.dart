import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'directory.dart';
import 'files/audio_file.dart';
import 'files/image_file.dart';
import 'files/text_file.dart';
import 'files/video_file.dart';

class CompositeExample extends StatelessWidget {
  const CompositeExample();

  Widget _buildMediaDirectory() {
    final musicDirectory = Directory(
      title: 'Music',
    );
    musicDirectory.addFile(
        file: const AudioFile(title: 'Darude - Sandstorm.mp3', size: 2612453));
    musicDirectory.addFile(
        file: const AudioFile(title: 'Toto - Africa.mp3', size: 3219811));
    musicDirectory.addFile(
        file: const AudioFile(
            title: 'Bag Raiders - Shooting Stars.mp3', size: 3811214));

    final moviesDirectory = Directory(title: 'Movies');

    moviesDirectory.addFile(
        file: const VideoFile(title: 'The Matrix.avi', size: 951495532));
    moviesDirectory.addFile(
        file: const VideoFile(
            title: 'The Matrix Reloaded.mp4', size: 1251495532));

    final catPicturesDirectory = Directory(title: 'Cats');
    catPicturesDirectory.addFile(
        file: const ImageFile(title: 'Cat 1.jpg', size: 844497));
    catPicturesDirectory.addFile(
        file: const ImageFile(title: 'Cat 2.jpg', size: 975363));
    catPicturesDirectory.addFile(
        file: const ImageFile(title: 'Cat 3.png', size: 1975363));

    final picturesDirectory = Directory(title: 'Pictures');
    picturesDirectory.addFile(file: catPicturesDirectory);
    picturesDirectory.addFile(
        file: const ImageFile(title: 'Not a cat.png', size: 2971361));

    final mediaDirectory = Directory(title: 'Media', isInitiallyExpanded: true);
    mediaDirectory.addFile(file: musicDirectory);
    mediaDirectory.addFile(file: moviesDirectory);
    mediaDirectory.addFile(file: picturesDirectory);
    mediaDirectory.addFile(file: Directory(title: 'New Folder'));
    mediaDirectory.addFile(
        file: const TextFile(
            title: 'Nothing suspicious there.txt', size: 430791));
    mediaDirectory.addFile(
        file: const TextFile(title: 'TeamTrees.txt', size: 1042));

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: _buildMediaDirectory(),
      ),
    );
  }
}
