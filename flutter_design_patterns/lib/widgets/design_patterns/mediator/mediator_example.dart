import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';
import 'package:flutter_design_patterns/design_patterns/mediator/notification_hub.dart';
import 'package:flutter_design_patterns/design_patterns/mediator/notification_hub/team_notification_hub.dart';
import 'package:flutter_design_patterns/design_patterns/mediator/team_member.dart';
import 'package:flutter_design_patterns/design_patterns/mediator/team_members/team_members.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/mediator/notification_list.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class MediatorExample extends StatefulWidget {
  const MediatorExample({Key? key}) : super(key: key);

  @override
  _MediatorExampleState createState() => _MediatorExampleState();
}

class _MediatorExampleState extends State<MediatorExample> {
  late final NotificationHub _notificationHub;
  final _admin = Admin(name: "God");

  @override
  void initState() {
    super.initState();

    final _members = [
      _admin,
      Developer(name: 'Sea Sharp'),
      Developer(name: 'Jan Assembler'),
      Developer(name: 'Dove Dart'),
      Tester(name: 'Cori Debugger'),
      Tester(name: 'Tania Mocha'),
    ];

    _notificationHub = TeamNotificationHub(members: _members);
  }

  void _sendToAll() {
    setState(() {
      _admin.send('Hello');
    });
  }

  void _sendToQa() {
    setState(() {
      _admin.sendTo<Tester>('BUG!');
    });
  }

  void _sendToDevelopers() {
    setState(() {
      _admin.sendTo<Developer>('Hello, World!');
    });
  }

  void _sendFromMember(TeamMember member) {
    setState(() {
      member.send('Hello from ${member.name}');
    });
  }

  void _addTeamMember() {
    final name = "${faker.person.firstName()} ${faker.person.lastName()}";
    final teamMember = faker.randomGenerator.boolean()
        ? Tester(name: name)
        : Developer(name: name);

    setState(() {
      _notificationHub.register(teamMember);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PlatformButton(
              text: "Admin: Send 'Hello' to all",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _sendToAll,
            ),
            PlatformButton(
              text: "Admin: Send 'BUG!' to QA",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _sendToQa,
            ),
            PlatformButton(
              text: "Admin: Send 'Hello, World!' to Developers",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _sendToDevelopers,
            ),
            const Divider(),
            PlatformButton(
              text: "Add team member",
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _addTeamMember,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            NotificationList(
              members: _notificationHub.getTeamMembers(),
              onTap: _sendFromMember,
            ),
          ],
        ),
      ),
    );
  }
}
