import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback onClicked;

  const OptionWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClicked,
  }) : super(key: key,);

  @override
  Widget build(BuildContext context,) {
    final color = Theme.of(context,).colorScheme.primary;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18,),
            ),
            icon,
          ],
        ),
      ),
      onTap: () {
        onClicked();
      },
    );
  }
}
