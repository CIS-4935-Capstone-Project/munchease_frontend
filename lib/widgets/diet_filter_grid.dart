import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_diet_controller.dart';
import 'package:munchease/widgets/me_filterchip.dart';

class DietFilterGrid extends StatelessWidget {
  DietFilterGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingDietController controller;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _scrollController,
        radius: const Radius.circular(10),
        thumbVisibility: true,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [
              Obx(() => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: controller.diets
                      .asMap()
                      .entries
                      .map((entry) => MunchChip(
                          onSelected: (_) {
                            controller.changeIndex(entry.key);
                          },
                          label: entry.value,
                          selected: entry.key == controller.selectedIndex))
                      .toList()))
            ])));
  }
}
