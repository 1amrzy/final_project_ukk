import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 3000),
        ((){
          Get.offAllNamed(Routes.BOARDING_SCREEN);
        })
    );
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: 
          Lottie.asset('images/splash.json', fit: BoxFit.fill),
        ),
      )
    );
  }
}
