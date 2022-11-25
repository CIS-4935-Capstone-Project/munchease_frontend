import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const DrawerTile({required this.title, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            // color: MunchColors.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        height: 75,
        width: double.infinity,
        child: Align(alignment: Alignment.centerLeft, child: Text(title)),
      ),
    );
  }
}
