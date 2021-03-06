import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/visitor/i_visitor.dart';

abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
  String accept(IVisitor visitor);
}
