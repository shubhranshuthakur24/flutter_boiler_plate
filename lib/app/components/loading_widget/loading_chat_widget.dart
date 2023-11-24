
import 'package:flutter_boiler_plate/app/styles/colors.dart';
import 'package:flutter/cupertino.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20, // Adjust the width as needed
      height: 20, // Adjust the height as needed
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kColorLavenderBlue,
      ),
    );
  }
}

class BouncingLoadingCircularContainer extends StatelessWidget {
  const BouncingLoadingCircularContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        BouncingCircularContainer(),
        const SizedBox(width: 5,),
        BouncingCircularContainer(),
        const SizedBox(width: 5,),
        BouncingCircularContainer(),
        const SizedBox(width: 5,),
      ],
    );
  }
}








class BouncingCircularContainer extends StatefulWidget {
  @override
  _BouncingCircularContainerState createState() =>
      _BouncingCircularContainerState();
}

class _BouncingCircularContainerState extends State<BouncingCircularContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration:  const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _startAnimation();
  }

  void _startAnimation() {
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 5, // Adjust the width as needed
            height: 5, // Adjust the height as needed
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kColorMaroon, // Replace with your desired color
            ),
          ),
        );
      },
    );
  }
}

