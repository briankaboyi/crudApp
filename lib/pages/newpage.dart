import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:simple_data/app_model.dart';
import 'package:simple_data/widgets/text_widget.dart';

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

     Pinput(
        onCompleted: (pin) => print("from pinput >>> ${pin}"),
      ),
          Text(
            'widget to whatever you called it in pubspec.yaml. For this',
            style: TextStyle(
              fontFamily: 'ubuntu',
            ),
          ),
          text_widget(text: 'Whenever I add assets I find I need to do a full stop and restart. Otherwise I get errors.', color: 0xff444444, fontSize: 13, fontWeight: FontWeight.w300,font: 'ubuntu', textAlign: TextAlign.center),
          ElevatedButton(
              onPressed: () async {

                print(await getTickets('In progress'));

              },
              child: Text('call function')),
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
