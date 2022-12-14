import 'package:flutter/material.dart';
import 'package:munchease/utils/theme_utils.dart';

enum MunchButtonType { filled, line }

class MunchButton extends StatelessWidget {
  final MunchButtonType buttonType;
  final Widget child;
  final VoidCallback? onPressed;
  final double _buttonW = 280;
  final double _buttonH = 40;
  final double? height;
  final double? width;

  const MunchButton(
      {super.key,
      required this.buttonType,
      required this.child,
      required this.onPressed,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? _buttonW,
        height: height ?? _buttonH,
        child: DefaultTextStyle(
          style: TextStyle(
              color: buttonType == MunchButtonType.filled
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.onBackground),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            onTap: onPressed,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  border: buttonType == MunchButtonType.line
                      ? Border.all(
                          width: 1.0,
                          color: Theme.of(context).colorScheme.onBackground)
                      : null,
                  color: buttonType == MunchButtonType.filled
                      ? Theme.of(context).colorScheme.onBackground
                      : MunchColors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: Center(child: child),
            ),
          ),
        ));
  }
}
