import 'package:flutter/material.dart';
import 'package:web_flutter/consts/consts.dart';

class IElevatedButton extends StatefulWidget {
  const IElevatedButton(
    this.text,
    this.icon, {
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onPressed;

  @override
  State<IElevatedButton> createState() => _IElevatedButtonState();
}

class _IElevatedButtonState extends State<IElevatedButton> {
  bool onHover = false;

  Color? get colors {
    return onHover ? Colors.white : Globals.oceanBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onHover ? Globals.oceanBlue : Colors.white60,
        ),
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            onHover = !onHover;
          });
        },
        child: Padding(
          padding: onHover
              ? EdgeInsets.symmetric(horizontal: 11, vertical: 5)
              : EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            children: [
              Icon(
                widget.icon,
                color: colors,
                size: 26,
              ),
              const SizedBox(height: 2),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colors,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
