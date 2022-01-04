import 'package:flutter_design_patterns/design_patterns/mediator/team_member.dart';

class Developer extends TeamMember {
  Developer({required String name}) : super(name);

  @override
  String toString() {
    return "$name (Developer)";
  }
}
