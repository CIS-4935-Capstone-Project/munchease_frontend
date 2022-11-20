import 'package:flutter/material.dart';
import 'package:munchease/utils/theme_utils.dart';

enum MunchButtonType { filled, line }

class MunchButton extends StatelessWidget {
  final MunchButtonType buttonType;
  final Widget child;
  final VoidCallback? onPressed;
  final double buttonW = 280;
  final double buttonH = 40;
  final double? height;
  final double? width;
  final double radius;

  const MunchButton({
    super.key,
    required this.buttonType,
    required this.child,
    required this.onPressed,
    this.height,
    this.width,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? buttonW,
        height: height ?? buttonH,
        child: DefaultTextStyle(
          style: TextStyle(
              color: buttonType == MunchButtonType.filled
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.onBackground),
          child: InkWell(
            splashColor: MunchColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            onTap: onPressed,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  border: buttonType == MunchButtonType.line
                      ? Border.all(
                          width: 2.0,
                          color: Theme.of(context).colorScheme.onBackground)
                      : null,
                  color: buttonType == MunchButtonType.filled
                      ? Theme.of(context).colorScheme.onBackground
                      : MunchColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              child: Center(child: child),
            ),
          ),
        ));
  }
}
