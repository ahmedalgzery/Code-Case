import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        // Wrap the text widget with SlideTransition to apply sliding animation.
        return SlideTransition(
          position:
              slidingAnimation, // Use slidingAnimation for the animation effect.
          child: const Text(
            'C++ Quizz',
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
