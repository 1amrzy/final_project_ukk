import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/home/controllers/home_controller.dart';

import '../../article/controllers/article_controller.dart';
import '../../book/controllers/book_controller.dart';
import '../controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<BookController>(
          () => BookController(),
    );
    Get.lazyPut<ArticleController>(
          () => ArticleController(),
    );
  }
}
