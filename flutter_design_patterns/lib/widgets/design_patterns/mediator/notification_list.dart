import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants/constants.dart';

import 'package:flutter_design_patterns/design_patterns/mediator/team_member.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    Key? key,
    required this.members,
    required this.onTap,
  }) : super(key: key);

  final List<TeamMember> members;
  final ValueSetter<TeamMember> onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Last notification",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        Text(
          "Note: click on the card to send a notification from the team member",
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: LayoutConstants.spaceS),
        for (final member in members)
          Card(
            margin: const EdgeInsets.symmetric(
              vertical: LayoutConstants.paddingS,
              horizontal: LayoutConstants.paddingL,
            ),
            child: InkWell(
              onTap: () => onTap(member),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: LayoutConstants.paddingM,
                  horizontal: LayoutConstants.paddingL,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: LayoutConstants.spaceS),
                          Text(member.lastNotification ?? "-"),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: LayoutConstants.paddingL),
                      child: Icon(Icons.message),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
