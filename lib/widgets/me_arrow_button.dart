import 'package:flutter/material.dart';
import 'package:munchease/utils/theme_utils.dart';

class MunchArrowButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double _buttonW = 40;
  final double _buttonH = 40;
  final double? height;
  final double? width;

  const MunchArrowButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? _buttonW,
        height: height ?? _buttonH,
        child: Material(
          child: InkWell(
            splashColor: MunchColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: onPressed,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Center(child: child),
            ),
          ),
        ));
  }
}
