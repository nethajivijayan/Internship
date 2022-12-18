import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> _animation;

  @override
  void initState() {
    _controller = new AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _animation = new IntTween(begin: 0, end: 116).animate(_controller);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              String frame = _animation.value.toString().padLeft(3, '0');
              return new Image.asset(
                'assets/frame_${frame}_delay-0.04s.png',
                gaplessPlayback: true,
              );
            },
          ),
          new Text('Image: Guillaume Kurkdjian', style: new TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

