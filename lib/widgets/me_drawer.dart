import 'dart:ui';

import 'package:flutter/material.dart';

class MunchDrawer extends StatelessWidget {
  const MunchDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 300,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black.withOpacity(0.8)
          : Colors.white.withOpacity(0.8),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[500]!.withOpacity(0.1)
                        : Colors.white.withOpacity(0.31),
                  ),
                ),
              ),
            ),
          ),
          DefaultTextStyle(
            style: TextStyle(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    print("f");
                  },
                  title: Text("Home"),
                ),
                ListTile(
                  onTap: () {
                    print("f");
                  },
                  title: Text("Saved Recipes"),
                ),
                ListTile(
                  onTap: () {
                    print("f");
                  },
                  title: Text("Profile"),
                ),
                ListTile(
                  onTap: () {
                    print("f");
                  },
                  title: Text("Settings"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
