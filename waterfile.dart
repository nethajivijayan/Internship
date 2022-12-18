
import 'package:flutter/material.dart';

class TapAnimation extends StatefulWidget {
  @override
  _TapAnimationState createState() => _TapAnimationState();
}

class _TapAnimationState extends State<TapAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  bool isFlowing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFlowing) {
          _controller.reverse();
        } else {
          _controller.forward();
        }

        isFlowing = !isFlowing;
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width:200,
            height:200,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top:0,
                  left:0,
                  right:0,
                  bottom:0,
                  child: Image.asset('assets/images/tap.png'),
                ),
                Positioned(
                  top:0,
                  left:0,
                  right:0,
                  bottom:0,
                  child: Image.asset('assets/images/tap.png'),
                ),
                Positioned(
                  top:0,
                  left:0,
                  right:0,
                  bottom:0,
                  child: Opacity(
                    opacity: _animation.value,
                    child: Image.asset('assets/images/water.png'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

