import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  RoundIconButton({@required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
      child: child,
    );
  }
}
