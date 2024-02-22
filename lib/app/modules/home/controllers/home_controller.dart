import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/views/book_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/home/views/home_view.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  final BookController landingPageController =
  Get.put(BookController(), permanent: true);
  final screen=[
    BookView(),
    BookView(),
    BookView(),
    BookView(),
  ];
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

    @override
    void dispose() {
      super.dispose();
    }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  
  void buku(){
    Get.toNamed(Routes.BOOK);
}

  void peminjaman(){
    Get.toNamed(Routes.PEMINJAMAN);
  }
}

