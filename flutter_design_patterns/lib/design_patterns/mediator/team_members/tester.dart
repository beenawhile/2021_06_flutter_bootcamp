import 'package:flutter_design_patterns/design_patterns/mediator/team_member.dart';

class Tester extends TeamMember {
  Tester({required String name}) : super(name);

  @override
  String toString() {
    return "$name (QA)";
  }
}
