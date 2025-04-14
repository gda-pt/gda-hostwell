// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class NavItem {
  final String title;
  final IconData icon;
  final String? route;

  NavItem({
    required this.title,
    required this.icon,
    this.route,
  });
}

class BuildSideNavMenuItems extends StatefulWidget {
  const BuildSideNavMenuItems({
    super.key,
    this.width,
    this.height,
    required this.navItems,
  });

  final double? width;
  final double? height;
  final List<NavItem> navItems;

  @override
  State<BuildSideNavMenuItems> createState() => _BuildSideNavMenuItemsState();
}

class _BuildSideNavMenuItemsState extends State<BuildSideNavMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: ListView.builder(
        itemCount: widget.navItems.length,
        itemBuilder: (context, index) {
          final item = widget.navItems[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {
                  if (item.route != null) {
                    context.pushNamed(item.route!); // FlutterFlow navigation
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped on ${item.title}')),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
