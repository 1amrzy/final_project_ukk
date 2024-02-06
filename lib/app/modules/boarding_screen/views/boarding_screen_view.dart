import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/boarding_screen_controller.dart';

class BoardingScreenView extends GetView<BoardingScreenController> {
  const BoardingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoardingScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BoardingScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
