import 'dart:math';

import 'package:flutter/material.dart';

// Done nov 9 ,  animate controller and tween animations

//      16 Nov , Done

//

class MyAnimationControler extends StatefulWidget {
  const MyAnimationControler({super.key});

  @override
  State<MyAnimationControler> createState() => _MyAnimationControlerState();
}

class _MyAnimationControlerState extends State<MyAnimationControler>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationDouble;
  late Animation<Color?> animationColor;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            //  print(controller.value);
            // print(animationDouble.value);
            // print(animationColor.value);
            /*  setState(() {});*/
          })
          ..forward();
    animationDouble = Tween<double>(begin: 10.0, end: 223.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    /* animationColor =
        ColorTween(begin: Colors.red, end: Colors.purple).animate(controller);*/

    // ..repeat(reverse: true  // reverse
    //           reverse: false  // restart
    // );
    //  ..forward();
    // controller.forward();  doble dot use
  }

  @override
  Widget build(BuildContext context) {
    print("build function called!");
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (_, mchild) {
              return Transform.rotate(
                angle: controller.value * 0.5 * pi,
                child: mchild,
              );
              //  https://en.wikipedia.org/wiki/Space#/media/File:3D_coordinate_system.svg
              /*return Transform.translate(
              offset: Offset(animationDouble.value - 50, animationDouble.value),
              child: mchild,
            );*/
              /*return Transform.scale(
                          scale: controller.value * 1,
                           child: mchild,
                         );*/
            },
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png",
              height: 300,
              width: 300,
            )
            //    https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png
            /*Container(
            width: 100, // animationDouble.value, //20 + controller.value * 200,
            height:
                100, // animationDouble.value, // 20 + controller.value * 200,
            color: Colors.blue,
            //   color: animationColor.value,
          ),*/
            ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

// Done nov 9 ,  animate controller and tween animations

//      16 Nov ,

class MyAnimationControler extends StatefulWidget {
  const MyAnimationControler({super.key});

  @override
  State<MyAnimationControler> createState() => _MyAnimationControlerState();
}

class _MyAnimationControlerState extends State<MyAnimationControler>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationDouble;
  late Animation<Color?> animationColor;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() {
            //  print(controller.value);
            // print(animationDouble.value);
            // print(animationColor.value);
            setState(() {});
          })
          ..repeat();
    animationDouble = Tween<double>(begin: 101.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.purple).animate(controller);
    // ..repeat(reverse: true  // reverse
    //           reverse: false  // restart
    // );
    //  ..forward();
    // controller.forward();  doble dot use
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Container(
          width: animationDouble.value, //20 + controller.value * 200,
          height: animationDouble.value, // 20 + controller.value * 200,
          color: animationColor.value,
        ),
      ),
    );
  }
}
*/
