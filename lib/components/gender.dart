import 'package:flutter/material.dart';

import '../constants.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData cardIcon;

  GenderCard({this.gender, this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
