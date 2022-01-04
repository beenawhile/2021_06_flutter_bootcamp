import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/template-method/template_method.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/template_method/students_data_table.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class StudentsSection extends StatefulWidget {
  const StudentsSection({
    Key? key,
    required this.bmiCalculator,
    required this.headerText,
  }) : super(key: key);

  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = [];

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        const SizedBox(height: LayoutConstants.spaceM),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _StudentsSectionContent(
            students: students,
            onPressed: _calculateBmiAndGetStudentsData,
          ),
        ),
      ],
    );
  }
}

class _StudentsSectionContent extends StatelessWidget {
  final List<Student> students;
  final VoidCallback onPressed;

  const _StudentsSectionContent({
    required this.students,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return students.isEmpty
        ? PlatformButton(
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: onPressed,
            text: "Calculate BMI and get students' data",
          )
        : StudentsDataTable(
            students: students,
          );
  }
}
