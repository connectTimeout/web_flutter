import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxCell extends StatefulWidget {
  const CheckboxCell({super.key, this.title, required this.isCheckbox});
  final String? title;
  final bool isCheckbox;

  @override
  State<CheckboxCell> createState() => _CheckboxCellState();
}

class _CheckboxCellState extends State<CheckboxCell> {
  bool isCheck = false;
  @override
  void initState() {
    super.initState();
    isCheck = widget.isCheckbox;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 243, 243),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 0.5,
                color: isCheck
                    ? const Color.fromARGB(255, 54, 202, 59)
                    : Colors.grey)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isCheck
                  ? CupertinoIcons.checkmark_square_fill
                  : CupertinoIcons.app,
              color: const Color.fromARGB(255, 221, 221, 221),
            ),
            const SizedBox(width: 5),
            Text(
              widget.title ?? '',
              style: TextStyle(
                  color: isCheck
                      ? const Color.fromARGB(255, 54, 202, 59)
                      : Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
