import 'package:flutter/material.dart';

class passField extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const passField({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key,);

  @override
  State<passField> createState() => _passFieldState();
}

class _passFieldState extends State<passField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text,);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context,) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0,),
            child: Text(
              widget.label,
              style: TextStyle(color: Colors.grey, fontSize: 13,),
            ),
          ),
          const SizedBox(height: 8,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade800, 

              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40.0,),
                ),
                borderSide: BorderSide.none,
              ),
              labelText: widget.text,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ],
      );
}
