import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/component/customSlide.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookmarkView'),
        centerTitle: true,
      ),
      body: Center()
    );
  }
}
