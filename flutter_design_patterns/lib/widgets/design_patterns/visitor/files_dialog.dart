import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class FilesDialog extends StatelessWidget {
  const FilesDialog({
    Key? key,
    required this.filesText,
  }) : super(key: key);

  final String filesText;

  void closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Files"),
      content: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(filesText),
          ),
        ),
      ),
      actions: [
        PlatformButton(
          text: "Close",
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: () => closeDialog(context),
        )
      ],
    );
  }
}
