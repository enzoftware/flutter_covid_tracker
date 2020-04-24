import 'package:flutter/material.dart';

class GlobalStatsText extends StatelessWidget {
  final String description;
  final int value;

  const GlobalStatsText({Key key, this.description, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: description,
          style: TextStyle(color: Colors.white, fontSize: 18),
          children: <TextSpan>[
            TextSpan(
              text: value.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
