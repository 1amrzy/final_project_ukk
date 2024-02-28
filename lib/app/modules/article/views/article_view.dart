import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
       slivers: [
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
                 (BuildContext con, int index){
               return Padding(
                 padding:
                 EdgeInsets.only(left: 20, bottom: 20, right: 10),
                 child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: CupertinoColors.secondarySystemFill.withOpacity(0.3),
                     ),
                     height: 200,
                     width: MediaQuery.of(context).size.width
                 ),
               );
             },
             childCount: 20,
           ),
         )
       ],
     ),
    );
  }
}
