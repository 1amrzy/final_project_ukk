import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          pinned: true,
          centerTitle: false,
          expandedHeight: 320.0,
          flexibleSpace: const FlexibleSpaceBar(
            background: Image(
              image: AssetImage('assets/images/slide_1.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          pinned: true,
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(-10.0), child: SizedBox()),
          flexibleSpace: const SearchBar(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext con, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20, right: 10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                          CupertinoColors.secondarySystemFill.withOpacity(0.3),
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width),
              );
            },
            childCount: 20,
          ),
        )
      ],
    ));
  }
}
