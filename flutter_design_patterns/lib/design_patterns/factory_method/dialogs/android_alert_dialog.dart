import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_design_patterns/design_patterns/factory_method/custom_dialog.dart';

class AndroidAlertDialog extends CustomDialog {
  @override
  Widget create(BuildContext context) {
    return AlertDialog(
      title: Text(getTitle()),
      content: const Text("This is the material-style alert dialog!"),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("Close"),
        ),
      ],
    );
  }

  @override
  String getTitle() {
    return "Android Alert Dialog";
  }
}
