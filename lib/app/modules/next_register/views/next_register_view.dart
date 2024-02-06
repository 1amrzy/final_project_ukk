import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/next_register_controller.dart';

class NextRegisterView extends GetView<NextRegisterController> {
  const NextRegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NextRegisterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NextRegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
