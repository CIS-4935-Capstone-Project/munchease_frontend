import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munchease/controllers/onboarding_cuisine_controller.dart';
import 'package:munchease/widgets/me_filterchip.dart';

class CuisineFilterGrid extends StatelessWidget {
  CuisineFilterGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingCuisineController controller;
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
          Obx(
            () => Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: controller.availableCuisines
                  .map((cuisine) => MunchChip(
                      selected: controller.selectedCuisines.contains(cuisine),
                      label: cuisine,
                      onSelected: (isSelected) {
                        controller.handleMunchchip(
                            cuisine: cuisine, isSelected: isSelected);
                      }))
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
