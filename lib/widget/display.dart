import 'package:flutter/material.dart';
import '../theme.dart';

// Gradient
class MyGradient extends StatelessWidget {
  const MyGradient(
      {Key? key, required this.child, this.gradient = MyTheme.gradient})
      : super(key: key);

  final Widget child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}

// Custom Text
class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    Key? key,
    this.style,
    this.gradient = MyTheme.gradient,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return MyGradient(
      gradient: gradient,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

// Custom Icon
class MyIcon extends StatelessWidget {
  const MyIcon(this.icon, {Key? key, this.size}) : super(key: key);

  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return MyGradient(
      child: Icon(icon, size: size),
    );
  }
}
