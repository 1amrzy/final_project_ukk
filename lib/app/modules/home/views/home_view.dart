import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customListBuku.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customListBuku2.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customSearchBar.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customSlide.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: false,
          expandedHeight: 300.0,
          flexibleSpace: const FlexibleSpaceBar(
            background: Image(
              image: AssetImage('assets/images/slide_1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.search,color: Color(0xFF6F6F6F)),
                      fillColor: Color(0xFFB6B3B3).withOpacity(0.4),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFB6B3B3), width: 2.0),
                        borderRadius: BorderRadius.circular(30.30),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB6B3B3), width: 2.0),
                          borderRadius: BorderRadius.circular(30.30)),
                      hintText: 'What do you want?',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins', color: Color(0xFF6F6F6F))),
                ),
              )),
          // flexibleSpace: const SearchBar(),
        ),
        SliverToBoxAdapter(
          child: customSlide(
            context: Get.context!,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommended",
                  style:TextStyle(
                      fontFamily: 'Poppins', color: Color(0xFF000000),fontWeight: FontWeight.w700,fontSize: 18
                  )),
                CustomListBuku(
                  context: Get.context!
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Paling Populer",
                    style:TextStyle(
                        fontFamily: 'Poppins', color: Color(0xFF000000),fontWeight: FontWeight.w700,fontSize: 18
                    )),
                CustomListBuku2(
                    context: Get.context!
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
