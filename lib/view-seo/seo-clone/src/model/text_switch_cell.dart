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
  void initState() {
    values = widget.value;
    super.initState();
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>((states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(
        Icons.check,
        size: 15,
      );
    }
    return const Icon(
      Icons.close,
      size: 15,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text("${widget.title}："),
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
                thumbIcon: thumbIcon,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
      ),
    );
  }
}
