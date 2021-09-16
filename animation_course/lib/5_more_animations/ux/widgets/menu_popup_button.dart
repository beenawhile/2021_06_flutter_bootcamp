import 'package:animation_course/5_more_animations/providers/theme_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MenuCommands {
  darkModeSwitch,
  settings,
}

class MenuPopupButton extends StatelessWidget {
  const MenuPopupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final themeModel = ref.watch(themeProvider);
      return PopupMenuButton<MenuCommands>(
        onSelected: (result) {
          switch (result) {
            case MenuCommands.darkModeSwitch:
              themeModel.changeTheme();
              break;
            default:
              break;
          }
        },
        offset: const Offset(0, 48),
        itemBuilder: (context) => <PopupMenuEntry<MenuCommands>>[
          CheckedPopupMenuItem<MenuCommands>(
            checked: themeModel.darkMode,
            value: MenuCommands.darkModeSwitch,
            child: const Text("Dark Mode"),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem<MenuCommands>(
              value: MenuCommands.settings,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              )),
        ],
      );
    });
  }
}
