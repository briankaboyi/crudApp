import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class newPage extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("./assets/commingsoon.json",height: 200,width: 200),
          ElevatedButton(onPressed: () {runLoop(100000);}, child: Text('run loop in main')),
          ElevatedButton(
              onPressed: () {
                Isolate.spawn(runLoop, 100000);
              },
              child: Text('run loop')),
        ],
      ),
    );
  }
}

runLoop(cycles) {
  var i;
  for (i = 0; i < cycles; i++) {
    print(i);
  }
  ;
}
