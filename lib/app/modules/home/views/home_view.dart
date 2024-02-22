import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/login/views/login_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/register/views/register_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/splash_screen/views/splash_screen_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx((){
          return Theme(
            data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.red)), child:
            BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: (index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.book,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                ),
                label: "Book",
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.book,
                  size: 20.0,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.article,
                    size: 20.0,
                  ),
                ),
                label: 'Article',
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.article,
                  size: 20.0,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.bookmark_add,
                    size: 20.0,
                  ),
                ),
                label: 'Bookmark',
                  backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.bookmark_add,
                  size: 20.0,
                  color: Colors.red,
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person,
                    size: 20.0,
                  ),
                ),
                label: 'Profile',
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  Icons.person,
                  size: 20.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),);
        }),
        body: controller.screen[controller.tabIndex.value]);
  }
}
