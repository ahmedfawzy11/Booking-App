import 'package:flutter/material.dart';

class userData extends StatelessWidget {
  final String label;
  final String text;

  const userData({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17),
            ),
          ],
        ),
      );
}
