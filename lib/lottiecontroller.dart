import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieController extends StatefulWidget {
  const LottieController({super.key});

  @override
  State<LottieController> createState() => _LottieControllerState();
}

class _LottieControllerState extends State<LottieController>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lottie animtion controller"),
      ),
      body: Column(
        children: [
          Lottie.asset("assets/lottie/anim.json.json", controller: _controller,
              onLoaded: (comp) {
            _controller.duration = comp.duration;
          }),
          ElevatedButton(
              onPressed: () {
                _controller.duration = Duration(seconds: 3);
                _controller.repeat(/*reverse: true*/);
                //  _controller.forward();
                //  _controller.reset();
              },
              child: Text("Start Animation")),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                //_controller.duration = Duration(seconds: 1);
                // _controller.repeat(reverse: true);
                _controller.reset();
                //  _controller.reset();
              },
              child: Text("reset"))
        ],
      ),
    );
  }
}
