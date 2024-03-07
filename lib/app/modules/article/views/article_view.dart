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
                       ),
                 ),
               )),
           // flexibleSpace: const SearchBar(),
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
