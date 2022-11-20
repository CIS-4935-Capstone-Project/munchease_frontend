import 'package:flutter/material.dart';
import 'package:munchease/utils/theme_utils.dart';

class MunchChip extends StatefulWidget {
  final Widget? avatar;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final bool? selected;
  final void Function(bool)? onSelected;
  final double? pressElevation;
  final Color? disabledColor;
  final Color? selectedColor;
  final String? tooltip;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final IconThemeData? iconTheme;
  final Color? selectedShadowColor;
  final bool? showCheckmark;
  final Color? checkmarkColor;
  final ShapeBorder avatarBorder;
  @override
  const MunchChip(
      {super.key,
      this.avatar,
      required this.label,
      this.labelStyle,
      this.labelPadding,
      this.selected,
      this.onSelected,
      this.pressElevation,
      this.disabledColor,
      this.selectedColor,
      this.tooltip,
      this.side,
      this.shape,
      this.clipBehavior = Clip.none,
      this.focusNode,
      this.autofocus = false,
      this.backgroundColor,
      this.padding,
      this.visualDensity,
      this.materialTapTargetSize,
      this.elevation,
      this.shadowColor,
      this.surfaceTintColor,
      this.iconTheme,
      this.selectedShadowColor,
      this.showCheckmark,
      this.checkmarkColor,
      this.avatarBorder = const CircleBorder()});

  @override
  State<MunchChip> createState() => _MunchChipState();
}

class _MunchChipState extends State<MunchChip> {
  late bool isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = widget.selected ?? false;
  }

  void changeSelection(data) {
    setState(() {
      var callback = widget.onSelected ?? (data) {};
      callback(data);
      isSelected = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawChip(
        showCheckmark: false,
        backgroundColor: MunchColors.transparent,
        selectedColor: MunchColors.primaryColor,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color:
                widget.selected ?? isSelected ? MunchColors.primaryDark : null),
        shape: StadiumBorder(
            side: BorderSide(
                width: 2,
                color: widget.selected ?? isSelected
                    ? MunchColors.transparent
                    : Theme.of(context).colorScheme.onBackground)),
        label: Text(widget.label),
        selected: widget.selected ?? isSelected,
        onSelected: changeSelection);
  }
}
