import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/home/views/home_view.dart';

import '../../article/views/article_view.dart';
import '../../book/views/book_view.dart';
import '../controllers/layout_controller.dart';

class LayoutView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller){
          return Scaffold(
            body: SafeArea(
                child: IndexedStack(
                  index: controller.tabIndex,
                  children: [
                    HomeView(),
                    BookView(),
                    ArticleView(),
                    ArticleView(),
                  ],
                )
            ),

            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Color(0xFFB6B3B3),
              selectedItemColor: Color(0xFFFF0000),
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.house_fill,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.news_solid,
                  label: 'Article',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.bookmark_fill,
                  label: 'Bookmark',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.person_fill,
                  label: 'Profile',
                ),

              ],
            ),
          );
        }
    );
  }
  _bottomNavigationBarItem({IconData ? icon, String ? label}){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
