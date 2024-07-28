import 'package:flutter/material.dart';

class ComponentWrapper extends StatelessWidget {
  Color? backgroundColor;
  Color? borderColor;
  double? borderWidth;
  Widget? child;
  EdgeInsets? padding;
  final double? width;
  final double? height;
  BorderRadius? borderRadius;

  ComponentWrapper(
      {super.key,
        this.child,
        this.backgroundColor = Colors.white,
        this.borderWidth = 0,
        this.borderColor = Colors.white,
        this.width,
        this.height,
        this.borderRadius,
        this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: borderWidth!, color: borderColor!),
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(8)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
          ),
        ],
      ),
      child: child,
    );
  }
}