import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customSlide.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Bookmark",
              style:TextStyle(
                  fontFamily: 'Poppins', color: Color(0xFFFF0000),fontWeight: FontWeight.bold,fontSize: 22
              )),
              InkWell(
                  onTap: () => Get.offAllNamed(Routes.ADD_PEMINJAMAN),
                child: Icon(Icons.add)
              )
            ],
          ),
        ),
      body: Center()
    );
  }
}
