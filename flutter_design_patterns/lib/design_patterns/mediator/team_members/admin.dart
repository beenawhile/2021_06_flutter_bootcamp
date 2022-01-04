import 'package:flutter_design_patterns/design_patterns/mediator/team_member.dart';

class Admin extends TeamMember {
  Admin({required String name}) : super(name);

  @override
  String toString() {
    return "$name (Admin)";
  }
}
