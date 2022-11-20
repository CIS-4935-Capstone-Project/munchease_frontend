import 'package:flutter/material.dart';

Widget buildProgressIndicator() => const Center(
      child: CircularProgressIndicator(),
    );

AppBar buildTitleAppBar(String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: const TextStyle(
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w700,
        fontSize: 36.0,
      ),
    ),
  );
}
