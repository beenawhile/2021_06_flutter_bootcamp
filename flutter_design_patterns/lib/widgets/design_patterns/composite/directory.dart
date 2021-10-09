import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/composite/ifile.dart';
import 'package:flutter_design_patterns/helpers/index.dart';

class Directory extends StatelessWidget implements IFile {
  Directory({
    Key? key,
    required this.title,
    this.isInitiallyExpanded = false,
  }) : super(key: key);

  final String title;
  final bool isInitiallyExpanded;

  final List<IFile> files = [];

  void addFile({required IFile file}) {
    files.add(file);
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }

  @override
  int getSize() {
    var sum = 0;
    for (final file in files) {
      sum += file.getSize();
    }
    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: LayoutConstants.paddingS),
        child: ExpansionTile(
          leading: const Icon(Icons.folder),
          title: Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
          initiallyExpanded: isInitiallyExpanded,
          children: files.map((IFile file) => file.render(context)).toList(),
        ),
      ),
    );
  }
}
