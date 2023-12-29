import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({Key? key}) : super(key: key);
  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 56,
      ),
      child: Stack(
        children: [
          Container(
            width: 100,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(1),
                  _buildDot(2),
                  _buildDot(3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int dotNumber) {
    return ScaleTransition(
      scale: Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            (dotNumber - 1) * 0.2, // Adjust the interval for each dot
            dotNumber * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      ),
      child: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
