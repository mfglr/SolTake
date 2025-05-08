import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolWidget extends StatelessWidget {
  final int solPerToken;
  const SolWidget({
    super.key,
    required this.solPerToken
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: const FaIcon(
            FontAwesomeIcons.coins,
            color: Colors.amber,
          ),
        ),
        Text(
          "$solPerToken Sol",
        )
      ],
    );
  }
}