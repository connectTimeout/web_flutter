import 'package:flutter/material.dart';
import 'package:web_flutter/components/components.dart';

class TextSwitchCell extends StatefulWidget {
  const TextSwitchCell({
    super.key,
    required this.value,
    this.title,
    this.message,
  });
  final String? title;
  final String? message;
  final bool value;

  @override
  State<TextSwitchCell> createState() => _TextSwitchCellState();
}

class _TextSwitchCellState extends State<TextSwitchCell> {
  bool values = true;
  @override
  Widget build(BuildContext context) {
    values = widget.value;
    return Row(
      children: [
        Text("${widget.title}："),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Switch(
              value: values,
              onChanged: (value) {
                setState(() {
                  values = value;
                });
              }),
        ),
        ITooltip(
          message: widget.message ?? "",
          size: 18,
        ),
      ],
    );
  }
}
