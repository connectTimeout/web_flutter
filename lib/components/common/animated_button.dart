import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key, this.value, this.onTap});

  final String? value;
  final GestureTapCallback? onTap;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 100,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 30.0,
              offset: Offset(0.0, 30.0),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white60,
              Colors.black,
              Colors.black,
              Colors.white60
            ],
          ),
        ),
        child: Center(
          child: Text(
            widget.value ?? '-',
            style: GoogleFonts.abel(
              color: Colors.white,
              fontSize: 40
            ),
          ),
        ),
      );
}
